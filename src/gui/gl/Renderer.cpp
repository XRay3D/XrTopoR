#include "gui/gl/Renderer.h"

#include <QFile>
#include <QOpenGLContext>
#include <cmath>
#include <cstddef>

namespace xr::gui::gl {

namespace {

static_assert(sizeof(SegmentRec) == 36 && sizeof(ArcRec) == 44 && sizeof(FillVertex) == 20 && sizeof(MarkerRec) == 12);

constexpr unsigned kSampleShading = 0x8C36;  // GL_SAMPLE_SHADING (OpenGL 4.0)

QByteArray source(const char* name) {
  QFile f(QString(":/shaders/%1").arg(name));
  f.open(QIODevice::ReadOnly);
  return f.readAll();
}

void upload(QOpenGLBuffer& b, const void* data, size_t bytes) {
  if (!b.isCreated()) b.create();
  b.bind();
  b.allocate(data, int(bytes));
}

QVector4D vec(Color c) { return {c.r / 255.f, c.g / 255.f, c.b / 255.f, c.a / 255.f}; }

}  // namespace

bool Renderer::init(QString* error) {
  initializeOpenGLFunctions();
  const QSurfaceFormat fmt = QOpenGLContext::currentContext()->format();
  if (fmt.majorVersion() < 3 || (fmt.majorVersion() == 3 && fmt.minorVersion() < 3)) {
    if (error) *error = QString("OpenGL %1.%2: 3.3 is needed").arg(fmt.majorVersion()).arg(fmt.minorVersion());
    return false;
  }
  sampleShading_ = fmt.majorVersion() >= 4 || QOpenGLContext::currentContext()->hasExtension("GL_ARB_sample_shading");
  const QByteArray head = "#version 330 core\n" + source("view.glsl") + source("cover.glsl");
  auto make = [&](Prog p, const char* vert, const char* frag) {
    auto sp = std::make_unique<QOpenGLShaderProgram>();
    bool ok = sp->addShaderFromSourceCode(QOpenGLShader::Vertex, head + source(vert)) &&
              sp->addShaderFromSourceCode(QOpenGLShader::Fragment, head + source(frag)) && sp->link();
    if (!ok && error) *error += QString("%1 + %2: %3\n").arg(vert, frag, sp->log());
    prog_[p] = std::move(sp);
    return ok;
  };
  bool ok = make(Segment, "segment.vert", "segment.frag");
  ok = make(Hole, "segment.vert", "hole.frag") && ok;
  ok = make(Arc, "arc.vert", "arc.frag") && ok;
  ok = make(Fill, "fill.vert", "fill.frag") && ok;
  ok = make(Flat, "box.vert", "flat.frag") && ok;
  ok = make(Grid, "box.vert", "grid.frag") && ok;
  ok = make(Marker, "marker.vert", "marker.frag") && ok;
  ok = make(Layer, "box.vert", "layer.frag") && ok;
  for (Gpu& g : gpu_) g.vao.create();
  return ok;
}

void Renderer::destroy() {
  for (Gpu& g : gpu_) {
    for (QOpenGLBuffer* b : {&g.segments, &g.holes, &g.arcs, &g.fill, &g.markers}) b->destroy();
    g.vao.destroy();
  }
  for (auto& p : prog_) p.reset();
  layerMs_.reset();
  layer_.reset();
}

void Renderer::upload(Slot slot, const SceneData& s) {
  Gpu& g = gpu_[slot];
  gl::upload(g.segments, s.segments.data(), s.segments.size() * sizeof(SegmentRec));
  gl::upload(g.holes, s.holes.data(), s.holes.size() * sizeof(SegmentRec));
  gl::upload(g.arcs, s.arcs.data(), s.arcs.size() * sizeof(ArcRec));
  gl::upload(g.fill, s.fill.data(), s.fill.size() * sizeof(FillVertex));
  gl::upload(g.markers, s.markers.data(), s.markers.size() * sizeof(MarkerRec));
  g.steps = s.steps;
}

void Renderer::begin(const Frame& f, unsigned target) {
  frame_ = f;
  target_ = target;
  glBindFramebuffer(GL_FRAMEBUFFER, target_);
  glViewport(0, 0, f.w, f.h);
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_CULL_FACE);
  glDisable(GL_SCISSOR_TEST);
  glDisable(GL_STENCIL_TEST);
  glColorMask(true, true, true, true);
  glStencilMask(0xff);
  glClearColor(f.background.r / 255.f, f.background.g / 255.f, f.background.b / 255.f, 1);
  glClearStencil(0);
  glClear(GL_COLOR_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
  glEnable(GL_BLEND);
  glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);  // premultiplied
  // The view: the centre in whole nanometres and its rest.
  const double icx = std::round(f.cx), icy = std::round(f.cy);
  for (auto& p : prog_) {
    p->bind();
    glUniform2i(p->uniformLocation("uCentre"), int(icx), int(icy));
    p->setUniformValue("uFrac", float(f.cx - icx), float(f.cy - icy));
    p->setUniformValue("uScale", float(f.scale));
    p->setUniformValue("uHalfView", f.w / 2.f, f.h / 2.f);
  }
  prog_[Hole]->bind();
  prog_[Hole]->setUniformValue("uEdge", vec(f.holeEdge));
  prog_[Hole]->setUniformValue("uBack", vec(f.background));
  if (f.grid && f.gridX > 0 && f.gridY > 0) {
    QOpenGLShaderProgram& p = *prog_[Grid];
    p.bind();
    // A node next to the centre, in pixels from it (in doubles: the board is far from its origin).
    const double sx = f.gridX * f.scale, sy = f.gridY * f.scale;
    p.setUniformValue("uPhase", float((std::round(f.cx / f.gridX) * f.gridX - f.cx) * f.scale), float((std::round(f.cy / f.gridY) * f.gridY - f.cy) * f.scale));
    p.setUniformValue("uStep", float(sx), float(sy));
    p.setUniformValue("uDots", f.gridDots);
    p.setUniformValue("uColor", vec(f.gridColor));
    wholeView(Grid);
  }
}

void Renderer::end() {
  glBindVertexArray(0);
  glDisable(GL_BLEND);
  glDisable(GL_STENCIL_TEST);
  glUseProgram(0);
}

void Renderer::wholeView(Prog p) {
  prog_[p]->bind();
  prog_[p]->setUniformValue("uWhole", true);
  gpu_[Board].vao.bind();
  for (int i = 0; i < 4; ++i) glDisableVertexAttribArray(GLuint(i));
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

void Renderer::draw(Slot slot) {
  Gpu& g = gpu_[slot];
  const size_t n = g.steps.size();
  for (size_t i = 0; i < n;) {
    const Step& s = g.steps[i];
    const float alpha = s.blend == Blend::Copper ? frame_.copperAlpha : s.blend == Blend::ActiveCopper ? frame_.activeAlpha : 1.f;
    size_t j = i + 1;
    if (alpha >= 0.999f) {
      drawStep(g, s);
      i = j;
      continue;
    }
    while (j < n && g.steps[j].blend == s.blend && g.steps[j].layer == s.layer) ++j;
    if (alpha > 0.001f) {
      // The layer apart, then over the picture with its transparency.
      layerTarget();
      for (size_t k = i; k < j; ++k) drawStep(g, g.steps[k]);
      QOpenGLFramebufferObject::blitFramebuffer(layer_.get(), layerMs_.get(), GL_COLOR_BUFFER_BIT, GL_NEAREST);
      glBindFramebuffer(GL_FRAMEBUFFER, target_);
      glViewport(0, 0, frame_.w, frame_.h);
      glEnable(GL_BLEND);
      glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
      QOpenGLShaderProgram& p = *prog_[Layer];
      p.bind();
      glActiveTexture(GL_TEXTURE0);
      glBindTexture(GL_TEXTURE_2D, layer_->texture());
      p.setUniformValue("uLayer", 0);
      p.setUniformValue("uAlpha", alpha);
      wholeView(Layer);
      glBindTexture(GL_TEXTURE_2D, 0);
    }
    i = j;
  }
}

void Renderer::layerTarget() {
  const QSize size(frame_.w, frame_.h);
  if (!layerMs_ || layerMs_->size() != size) {
    QOpenGLFramebufferObjectFormat ms;
    ms.setSamples(4);
    ms.setAttachment(QOpenGLFramebufferObject::CombinedDepthStencil);
    layerMs_ = std::make_unique<QOpenGLFramebufferObject>(size, ms);
    layer_ = std::make_unique<QOpenGLFramebufferObject>(size, QOpenGLFramebufferObjectFormat());
  }
  layerMs_->bind();
  glViewport(0, 0, frame_.w, frame_.h);
  glClearColor(0, 0, 0, 0);
  glStencilMask(0xff);
  glClear(GL_COLOR_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
  glClearColor(frame_.background.r / 255.f, frame_.background.g / 255.f, frame_.background.b / 255.f, 1);
}

void Renderer::drawStep(Gpu& g, const Step& s) {
  if (s.kind == Step::Kind::Dim) {
    prog_[Flat]->bind();
    prog_[Flat]->setUniformValue("uColor", vec(s.color));
    prog_[Flat]->setUniformValue("uHatch", false);
    wholeView(Flat);
    return;
  }
  if (!s.count) return;
  g.vao.bind();
  auto ints = [&](GLuint loc, int n, size_t stride, size_t offset, int divisor) {
    glEnableVertexAttribArray(loc);
    glVertexAttribIPointer(loc, n, GL_INT, GLsizei(stride), reinterpret_cast<const void*>(offset));
    glVertexAttribDivisor(loc, GLuint(divisor));
  };
  auto floats = [&](GLuint loc, int n, size_t stride, size_t offset, int divisor) {
    glEnableVertexAttribArray(loc);
    glVertexAttribPointer(loc, n, GL_FLOAT, GL_FALSE, GLsizei(stride), reinterpret_cast<const void*>(offset));
    glVertexAttribDivisor(loc, GLuint(divisor));
  };
  auto color = [&](GLuint loc, size_t stride, size_t offset) {
    glEnableVertexAttribArray(loc);
    glVertexAttribPointer(loc, 4, GL_UNSIGNED_BYTE, GL_TRUE, GLsizei(stride), reinterpret_cast<const void*>(offset));
    glVertexAttribDivisor(loc, 1);
  };
  auto unused = [&](GLuint from) {
    for (GLuint i = from; i < 4; ++i) glDisableVertexAttribArray(i);
  };
  switch (s.kind) {
    case Step::Kind::Segments:
    case Step::Kind::Holes: {
      const bool hole = s.kind == Step::Kind::Holes;
      prog_[hole ? Hole : Segment]->bind();
      (hole ? g.holes : g.segments).bind();
      const size_t st = sizeof(SegmentRec), at = s.first * st;
      ints(0, 4, st, at, 1);
      floats(1, 4, st, at + offsetof(SegmentRec, half), 1);
      color(2, st, at + offsetof(SegmentRec, color));
      unused(3);
      glDrawArraysInstanced(GL_TRIANGLE_STRIP, 0, 4, GLsizei(s.count));
      break;
    }
    case Step::Kind::Arcs: {
      prog_[Arc]->bind();
      g.arcs.bind();
      const size_t st = sizeof(ArcRec), at = s.first * st;
      ints(0, 2, st, at, 1);
      floats(1, 4, st, at + offsetof(ArcRec, radius), 1);
      floats(2, 4, st, at + offsetof(ArcRec, half), 1);
      color(3, st, at + offsetof(ArcRec, color));
      glDrawArraysInstanced(GL_TRIANGLE_STRIP, 0, 4, GLsizei(s.count));
      break;
    }
    case Step::Kind::Markers: {
      prog_[Marker]->bind();
      g.markers.bind();
      const size_t st = sizeof(MarkerRec), at = s.first * st;
      ints(0, 2, st, at, 1);
      color(1, st, at + offsetof(MarkerRec, color));
      unused(2);
      glDrawArraysInstanced(GL_TRIANGLE_STRIP, 0, 4, GLsizei(s.count));
      break;
    }
    case Step::Kind::Fill: {
      // The fans counted in the stencil, front faces up and back faces down ...
      prog_[Fill]->bind();
      g.fill.bind();
      const size_t st = sizeof(FillVertex), at = s.first * st;
      ints(0, 2, st, at, 0);
      floats(1, 3, st, at + offsetof(FillVertex, u), 0);
      unused(2);
      glEnable(GL_STENCIL_TEST);
      glColorMask(false, false, false, false);
      glStencilFunc(GL_ALWAYS, 0, 0xff);
      glStencilOpSeparate(GL_FRONT, GL_KEEP, GL_KEEP, GL_INCR_WRAP);
      glStencilOpSeparate(GL_BACK, GL_KEEP, GL_KEEP, GL_DECR_WRAP);
      if (sampleShading_ && s.curved) {  // (the curves cut every sample, not every pixel)
        glEnable(kSampleShading);
        glMinSampleShading(1.0f);
      }
      glDrawArrays(GL_TRIANGLES, 0, GLsizei(s.count));
      if (sampleShading_ && s.curved) glDisable(kSampleShading);
      // ... and the colour where the count is not zero, the count taken back.
      glColorMask(true, true, true, true);
      glStencilFunc(GL_NOTEQUAL, 0, 0xff);
      glStencilOp(GL_KEEP, GL_KEEP, GL_ZERO);
      QOpenGLShaderProgram& p = *prog_[Flat];
      p.bind();
      p.setUniformValue("uWhole", false);
      glUniform4i(p.uniformLocation("uBox"), s.box[0], s.box[1], s.box[2], s.box[3]);
      p.setUniformValue("uColor", vec(s.color));
      p.setUniformValue("uHatch", s.hatch);
      unused(0);
      glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
      glDisable(GL_STENCIL_TEST);
      break;
    }
    case Step::Kind::Dim: break;
  }
}

}  // namespace xr::gui::gl

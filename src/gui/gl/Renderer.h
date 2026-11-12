#pragma once
// Draws gl::SceneData with OpenGL 3.3: a square an object for the segments, arcs, holes and marks, their shape and
// their antialiased edge found in the fragment shader; the fills through the stencil (the fans counted, then one
// rectangle a colour where the count is not zero), antialiased by the multisampling. A copper layer that is to be
// transparent is drawn apart and laid over the picture whole, so that what overlaps within it does not show.
#include <QOpenGLBuffer>
#include <QOpenGLExtraFunctions>
#include <QOpenGLFramebufferObject>
#include <QOpenGLShaderProgram>
#include <QOpenGLVertexArrayObject>
#include <array>
#include <memory>

#include "gui/gl/Scene.h"

namespace xr::gui::gl {

class Renderer : protected QOpenGLExtraFunctions {
 public:
  // The scenes drawn one over another: the board, what is selected and marked on it, the tool's work in hand.
  enum Slot { Board, Highlight, Overlay, kSlots };
  struct Frame {
    double cx = 0, cy = 0;  // the view's centre, nm
    double scale = 1;       // device pixels a nm
    int w = 1, h = 1;       // device pixels
    Color background, holeEdge;
    bool grid = false, gridDots = true;
    Color gridColor;
    double gridX = 0, gridY = 0;  // nm, as drawn (not denser than the pixels allow)
    float copperAlpha = 1, activeAlpha = 1;  // of the copper layers, of the active one
  };

  // With the context current. False: `error` says what the context lacks or which shader failed.
  bool init(QString* error);
  void upload(Slot slot, const SceneData& scene);
  // A frame into the framebuffer `target`: cleared, the grid; then the slots in turn.
  void begin(const Frame& f, unsigned target);
  void draw(Slot slot);
  void end();
  void destroy();  // with the context current

 private:
  enum Prog { Segment, Hole, Arc, Fill, Flat, Grid, Marker, Layer, kProgs };
  struct Gpu {
    QOpenGLBuffer segments, holes, arcs, fill, markers;
    QOpenGLVertexArrayObject vao;
    std::vector<Step> steps;
  };
  void drawStep(Gpu& g, const Step& s);
  void drawRun(Gpu& g, size_t from, size_t to);
  void wholeView(Prog p);
  void layerTarget();

  std::array<std::unique_ptr<QOpenGLShaderProgram>, kProgs> prog_;
  std::array<Gpu, kSlots> gpu_;
  std::unique_ptr<QOpenGLFramebufferObject> layerMs_, layer_;
  Frame frame_;
  unsigned target_ = 0;
  bool sampleShading_ = false;
};

}  // namespace xr::gui::gl

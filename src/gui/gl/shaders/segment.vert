layout(location = 0) in ivec4 aEnds;    // a, b
layout(location = 1) in vec4 aStroke;   // half nm, min px, max px, dash
layout(location = 2) in vec4 aColor;
out vec2 vAt;  // in the segment's frame: along it from a, across it; pixels
flat out vec3 vShape;  // length, half width, dash
flat out vec4 vColor;
flat out vec2 vMiddle;  // of the segment, in window pixels
void main() {
  vec2 a = toPx(aEnds.xy), b = toPx(aEnds.zw);
  vec2 d = b - a;
  float len = length(d);
  vec2 ex = len > 1e-6 ? d / len : vec2(1.0, 0.0), ey = vec2(-ex.y, ex.x);
  float r = strokePx(aStroke.x, aStroke.y, aStroke.z), m = r + 1.0;
  vec2 corner = vec2(gl_VertexID & 1, gl_VertexID >> 1);
  vAt = vec2(mix(-m, len + m, corner.x), mix(-m, m, corner.y));
  vShape = vec3(len, r, aStroke.w);
  vColor = aColor;
  vec2 mid = (a + b) * 0.5;
  vMiddle = vec2(mid.x + uHalfView.x, uHalfView.y - mid.y);
  gl_Position = toClip(a + ex * vAt.x + ey * vAt.y);
}

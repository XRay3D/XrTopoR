layout(location = 0) in ivec2 aCentre;
layout(location = 1) in vec4 aGeom;    // radius nm, the unit vector to the arc's middle, half the sweep
layout(location = 2) in vec4 aStroke;  // half nm, min px, max px, dash
layout(location = 3) in vec4 aColor;
out vec2 vAt;  // from the centre, x towards the arc's middle; pixels
flat out vec4 vShape;  // radius px, half width, half sweep, dash
flat out vec4 vColor;
void main() {
  vec2 c = toPx(aCentre);
  float R = aGeom.x * uScale, h = aGeom.w;
  vec2 ex = aGeom.yz, ey = vec2(-ex.y, ex.x);
  float r = strokePx(aStroke.x, aStroke.y, aStroke.z), m = r + 1.0;
  // The box of the arc with its width: from its ends' side to its middle, and across by its half chord.
  float x0 = (h < 1.5707963 ? R * cos(h) : -R) - m, x1 = R + m;
  float y1 = (h < 1.5707963 ? R * sin(h) : R) + m;
  vec2 corner = vec2(gl_VertexID & 1, gl_VertexID >> 1);
  vAt = vec2(mix(x0, x1, corner.x), mix(-y1, y1, corner.y));
  vShape = vec4(R, r, h, aStroke.w);
  vColor = aColor;
  gl_Position = toClip(c + ex * vAt.x + ey * vAt.y);
}

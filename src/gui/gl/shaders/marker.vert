layout(location = 0) in ivec2 aAt;
layout(location = 1) in vec4 aColor;
out vec2 vAt;  // pixels from the mark's point
flat out vec4 vColor;
void main() {
  vec2 corner = vec2(gl_VertexID & 1, gl_VertexID >> 1);
  vAt = (corner * 2.0 - 1.0) * 10.0;
  vColor = aColor;
  gl_Position = toClip(toPx(aAt) + vAt);
}

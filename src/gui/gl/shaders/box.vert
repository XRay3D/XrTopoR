// A rectangle of the board (the stencil's cover) or the whole view (uWhole).
uniform ivec4 uBox;
uniform bool uWhole;
void main() {
  vec2 corner = vec2(gl_VertexID & 1, gl_VertexID >> 1);
  if (uWhole) {
    gl_Position = vec4(corner * 2.0 - 1.0, 0.0, 1.0);
    return;
  }
  vec2 a = toPx(uBox.xy) - 1.0, b = toPx(uBox.zw) + 1.0;
  gl_Position = toClip(mix(a, b, corner));
}

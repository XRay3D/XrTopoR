uniform vec4 uColor;
uniform bool uHatch;  // diagonal lines, eight pixels apart
out vec4 fragColor;
void main() {
  if (uHatch) {
    ivec2 f = ivec2(floor(gl_FragCoord.xy));
    if ((((f.x - f.y) % 8) + 8) % 8 != 0) discard;
  }
  fragColor = vec4(uColor.rgb, 1.0) * uColor.a;
}

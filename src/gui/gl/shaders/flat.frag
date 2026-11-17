uniform vec4 uColor;
uniform bool uHatch;  // diagonal lines both ways, sixteen pixels apart
out vec4 fragColor;
void main() {
  if (uHatch) {
    ivec2 f = ivec2(floor(gl_FragCoord.xy));
    if ((((f.x - f.y) % 16) + 16) % 16 != 0 && (((f.x + f.y) % 16) + 16) % 16 != 0) discard;
  }
  fragColor = vec4(uColor.rgb, 1.0) * uColor.a;
}

// A drilled hole: the background dotted (a dot every seven pixels, counted from the hole's middle), a thin contour.
in vec2 vAt;
flat in vec3 vShape;
flat in vec2 vMiddle;
uniform vec4 uEdge, uBack;
out vec4 fragColor;
void main() {
  if (vShape.y < 0.5) discard;
  float d = length(vec2(vAt.x - clamp(vAt.x, 0.0, vShape.x), vAt.y)) - vShape.y;
  float inside = clamp(0.5 - d, 0.0, 1.0);
  float ring = clamp(1.0 - abs(d), 0.0, 1.0);
  ivec2 f = ivec2(floor(gl_FragCoord.xy)) - ivec2(floor(vMiddle));
  bool dot = ((f.x % 7) + 7) % 7 == 0 && ((f.y % 7) + 7) % 7 == 0;
  // The contour over the hole's inside, both over what is under them.
  float under = inside * (1.0 - ring), a = ring + under;
  if (a <= 0.0) discard;
  fragColor = vec4(uEdge.rgb * ring + (dot ? uEdge.rgb : uBack.rgb) * under, a);
}

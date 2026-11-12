// A violation's mark: a ring of 7 pixels with a cross in it, lines 2 pixels wide.
in vec2 vAt;
flat in vec4 vColor;
out vec4 fragColor;
float toSegment(vec2 p, vec2 a, vec2 b) {
  vec2 ab = b - a;
  return length(p - a - ab * clamp(dot(p - a, ab) / dot(ab, ab), 0.0, 1.0));
}
void main() {
  float d = min(abs(length(vAt) - 7.0), min(toSegment(vAt, vec2(-4.0), vec2(4.0)), toSegment(vAt, vec2(-4.0, 4.0), vec2(4.0, -4.0))));
  float a = coverage(d, 1.0);
  if (a <= 0.0) discard;
  fragColor = vec4(vColor.rgb, 1.0) * (vColor.a * a);
}

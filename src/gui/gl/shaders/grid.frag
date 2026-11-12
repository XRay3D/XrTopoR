// The grid: lines a pixel wide, or dots, at the nodes; every line on whole pixels.
uniform vec2 uPhase;  // a node from the view's centre, pixels (y down)
uniform vec2 uStep;   // pixels
uniform bool uDots;
uniform vec4 uColor;
out vec4 fragColor;
void main() {
  vec2 at = vec2(gl_FragCoord.x - uHalfView.x, uHalfView.y - gl_FragCoord.y);  // from the centre, y down
  vec2 node = round((at - uPhase) / uStep) * uStep + uPhase;
  vec2 d = abs(floor(at) - floor(node));
  float a = uDots ? clamp(1.25 - length(at - node), 0.0, 1.0) : (min(d.x, d.y) < 0.5 ? 1.0 : 0.0);
  if (a <= 0.0) discard;
  fragColor = vec4(uColor.rgb, 1.0) * (uColor.a * a);
}

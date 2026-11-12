// The view: a point of the board (nm, whole) to pixels from the view's centre (y down), and those to clip space.
// The centre is taken off in whole nanometres, so that nothing is lost however far in the view is.
uniform ivec2 uCentre;
uniform vec2 uFrac;      // the rest of the centre, nm
uniform float uScale;    // device pixels a nm
uniform vec2 uHalfView;  // device pixels
vec2 toPx(ivec2 p) { return (vec2(p - uCentre) - uFrac) * uScale; }
vec4 toClip(vec2 px) { return vec4(px.x / uHalfView.x, -px.y / uHalfView.y, 0.0, 1.0); }
// The half width on screen: `half` nm, within the limits in pixels (0: none).
float strokePx(float halfNm, float minPx, float maxPx) {
  float r = halfNm * uScale;
  if (minPx > 0.0) r = max(r, minPx);
  if (maxPx > 0.0) r = min(r, maxPx);
  return r;
}

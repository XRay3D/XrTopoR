// The stencil's pass: nothing is drawn, a triangle of an arc side keeps what lies in the circle, one of a quadratic
// curve what lies on the curve's inner side (Loop and Blinn).
in vec3 vCurve;
void main() {
  if (vCurve.z > 1.5) {
    if (vCurve.x * vCurve.x - vCurve.y > 0.0) discard;
  } else if (vCurve.z > 0.5) {
    if (dot(vCurve.xy, vCurve.xy) > 1.0) discard;
  }
}

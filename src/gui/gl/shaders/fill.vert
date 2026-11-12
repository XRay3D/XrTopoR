layout(location = 0) in ivec2 aPos;
layout(location = 1) in vec3 aCurve;  // u, v, kind
out vec3 vCurve;
void main() {
  vCurve = aCurve;
  gl_Position = toClip(toPx(aPos));
}

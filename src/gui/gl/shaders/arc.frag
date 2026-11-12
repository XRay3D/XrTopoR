in vec2 vAt;
flat in vec4 vShape;
flat in vec4 vColor;
out vec4 fragColor;
void main() {
  float R = vShape.x, h = vShape.z;
  vec2 q = vec2(vAt.x, abs(vAt.y));  // (the arc is the same on both sides of its middle)
  vec2 e = vec2(cos(h), sin(h));     // towards its end
  bool within = e.x * q.y - e.y * q.x <= 0.0;  // no further round than the end
  float d = within ? abs(length(q) - R) : length(q - e * R);
  float a = coverage(d, vShape.y);
  if (vShape.w != 0.0) {
    a = within ? a : 0.0;
    if (inGap((atan(vAt.y, vAt.x) + h) * R, vShape.w, vShape.y)) a = 0.0;
  }
  if (a <= 0.0) discard;
  fragColor = vec4(vColor.rgb, 1.0) * (vColor.a * a);
}

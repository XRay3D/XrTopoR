in vec2 vAt;
flat in vec3 vShape;
flat in vec4 vColor;
out vec4 fragColor;
void main() {
  float d = length(vec2(vAt.x - clamp(vAt.x, 0.0, vShape.x), vAt.y));
  float a = coverage(d, vShape.y);
  if (vShape.z != 0.0) {  // dashed: flat ends
    a = coverage(abs(vAt.y), vShape.y);
    if (vAt.x < 0.0 || vAt.x > vShape.x || inGap(vAt.x, vShape.z, vShape.y)) a = 0.0;
  }
  if (a <= 0.0) discard;
  fragColor = vec4(vColor.rgb, 1.0) * (vColor.a * a);
}

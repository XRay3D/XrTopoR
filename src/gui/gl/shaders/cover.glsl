// What a pixel a distance d from the middle of a stroke of half width r has of it (a box a pixel wide).
float coverage(float d, float r) { return clamp(r - d + 0.5, 0.0, 1.0) - clamp(-r - d + 0.5, 0.0, 1.0); }
// Dashes and gaps along the stroke: of `dash` pixels, or of -dash widths.
bool inGap(float along, float dash, float r) {
  if (dash == 0.0) return false;
  float len = dash > 0.0 ? dash : -dash * 2.0 * r;
  return mod(along, 2.0 * len) > len;
}

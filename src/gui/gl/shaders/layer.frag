// A copper layer drawn apart, laid over the picture with its transparency.
uniform sampler2D uLayer;
uniform float uAlpha;
out vec4 fragColor;
void main() { fragColor = texelFetch(uLayer, ivec2(gl_FragCoord.xy), 0) * uAlpha; }

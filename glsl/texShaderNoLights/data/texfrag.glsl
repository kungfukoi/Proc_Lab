#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  int si = int(vertTexCoord.x * 25.0);
  int sj = int(vertTexCoord.y * 25.0);
  gl_FragColor = texture2D(texture, vec2(float(si) / 25.0, float(sj) / 25.0)) * vertColor;
}

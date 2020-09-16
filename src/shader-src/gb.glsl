varying vec2 vTextureCoord;
uniform sampler2D uSampler;
void main() {
  vec4 oc = texture2D(uSampler, vTextureCoord);
  vec3 col = vec3(oc.rgb);
  col.rgb = vec3((oc.r * .29) + (oc.g * .59) + (oc.b * .045));
  col.g = col.g * 1.45;
  //May add later for darker tones
  // col.rgb = vec3(col.rgb * 0.8);
  gl_FragColor = vec4((vec3(col.rgb)), oc.a);
}
varying vec2 vTextureCoord;
uniform sampler2D uSampler;
void main(void){
  vec4 oc=texture2D(uSampler,vTextureCoord);
  vec4 col=oc;
  vec4 weighted_color=vec4(oc.r*.3,oc.g*.59,oc.b*.11,oc.a);
  vec3 grey_scale=vec3(.35,.35,.35);
  vec3 avg=oc.rgb*.65;
  col.rgb=vec3((oc.r*.3)+(oc.g*.59)+(oc.b*.11));
  vec4 avg_color=vec4(vec3(dot(oc.rgb,avg)),oc.a);
  gl_FragColor=vec4(vec3(col.rgb),oc.a);
}
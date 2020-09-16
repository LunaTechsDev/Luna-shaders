varying vec2 vTextureCoord;
uniform sampler2D uSampler;
void main(void){
  
  vec4 oc=texture2D(uSampler,vTextureCoord);
  vec3 col=vec3(oc.rgb);
  vec3 greyScale=vec3(.5,.5,.5);
  vec3 col=vec3(oc.rgb);
  col.rgb=vec3((oc.r*.29)+(oc.g*.59)+(oc.b*.045));
  col.b=col.b*1.95;
  // col.rgb = vec3(col.rgb * 0.8);
  fragColor=vec4(vec3(col.rgb),tex.a);
  
}
varying vec2 vTextureCoord;
uniform sampler2D uSampler;
uniform float time;
void main(void){
  //Normalized Pixel Coordinates in Pixi
  vec2 uv=vTextureCoord;
  float update_time=.05*time;
  const vec2 scale=vec2(.5);
  
  uv+=.05*sin(scale*update_time+length(uv)*1.5);
  gl_FragColor=texture2D(uSampler,uv);
}
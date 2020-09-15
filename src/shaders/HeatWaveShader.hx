package shaders;

import rm.core.Bitmap;
import pixi.core.renderers.webgl.filters.Filter;

@:keep
@:native("HeatWaveShader")
class HeatWaveShader extends Filter {
 public function new(texture: Bitmap, time: Float) {
  var fragShader = "
  varying vec2 vTextureCoord;
  uniform sampler2D uSampler;
  uniform float time;
  void main(void) {
    //Normalized Pixel Coordinates in Pixi
    vec2 uv =  vTextureCoord;
    float update_time = 0.05 * time;
    const vec2 scale = vec2(.5);

    uv += 0.05*sin(scale * update_time + length( uv) * 1.5);
    gl_FragColor = texture2D(uSampler, uv);
  }";

  super(null, fragShader, {
   uSampler: texture,
   time: time
  });
 }

 public static function create(texture: Bitmap, time: Float) {
  return new HeatWaveShader(texture, time);
 }
}

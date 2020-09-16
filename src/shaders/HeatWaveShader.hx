package shaders;

import rm.core.Bitmap;
import pixi.core.renderers.webgl.filters.Filter;

@:keep
@:native("HeatWaveShader")
@:build(macros.BuildMacros.attachFragShader("src/shader-src/heatwave.glsl"))
class HeatWaveShader extends Filter {
 public function new(texture: Bitmap, time: Float) {
  var fragShader = fragSrc;
  super(null, fragShader, {
   uSampler: texture,
   time: time
  });
 }

 public static function create(texture: Bitmap, time: Float) {
  return new HeatWaveShader(texture, time);
 }
}

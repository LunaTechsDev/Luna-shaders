package shaders;

import rm.core.Bitmap;
import pixi.core.renderers.webgl.filters.Filter;

@:keep
@:native("GBShader")
@:build(macros.BuildMacros.attachFragShader("src/shader-src/gb.glsl"))
class GBShader extends Filter {
 public function new(texture: Bitmap) {
  var fragShader = fragSrc;
  super(null, fragShader, {uSampler: texture});
 }

 public static function create(texture) {
  return new GBShader(texture);
 }
}

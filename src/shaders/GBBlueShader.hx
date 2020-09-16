package shaders;

import rm.core.Bitmap;
import pixi.core.renderers.webgl.filters.Filter;

@:keep
@:native("GBBlueShader")
@:build(macros.BuildMacros.attachFragShader("src/shader-src/gb-blue.glsl"))
class GBBlueShader extends Filter {
 public function new(texture: Bitmap) {
  var fragShader = fragSrc;
  super(null, fragShader, {uSampler: texture});
 }

 public static function create(texture) {
  return new GBBlueShader(texture);
 }
}

package shaders;

import rm.core.Bitmap;
import pixi.core.renderers.webgl.filters.Filter;

@:keep
@:native("MonochromeShader")
@:build(macros.BuildMacros.attachFragShader("src/shader-src/monochrome.glsl"))
class MonochromeShader extends Filter {
 public function new(texture: Bitmap) {
  var fragShader = fragSrc;
  super(null, fragShader, {uSampler: texture});
 }

 public static function create(texture: Bitmap) {
  return new MonochromeShader(texture);
 }
}

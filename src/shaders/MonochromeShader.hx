package shaders;

import rm.core.Bitmap;
import pixi.core.renderers.webgl.filters.Filter;

@:keep
@:native("MonochromeShader")
class MonochromeShader extends Filter {
 public function new(texture: Bitmap) {
  var fragShader = "
  varying vec2 vTextureCoord;
  uniform sampler2D uSampler;
  void main(void) {
    vec4 oc = texture2D(uSampler, vTextureCoord);
    vec4 weighted_color = vec4(oc.r * 0.3, oc.g * 0.59, oc.b * 0.11, oc.a);
    vec3 grey_scale = vec3(0.35, 0.35, 0.35);
    vec4 avg_color = vec4(vec3(dot(oc.rgb, grey_scale)), oc.a);
    gl_FragColor = avg_color;
  }";

  super(null, fragShader, {uSampler: texture});
 }

 public static function create(texture: Bitmap) {
  return new MonochromeShader(texture);
 }
}

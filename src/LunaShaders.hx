import shaders.HeatWaveShader;
import js.Syntax;
import haxe.DynamicAccess;
import js.Browser;
import utils.Comment;
import rm.Globals;
import shaders.*;

using Lambda;
using StringTools;
using core.NumberExtensions;

typedef CopyrightParams = {
 var x: Int;
 var y: Int;
 var width: Int;
 var height: Int;
 var fontSize: Int;
 var fontFace: String;
 var copyrightText: String;
}

@:expose("LunaShaders")
@:native("LunaShaders")
class LunaShaders {
 public static var CParams: CopyrightParams;
 public static var HeatWaveShader = shaders.HeatWaveShader;
 public static var MonochromeShader = shaders.MonochromeShader;

 public static function main() {
  Comment.title("Parameters");
  var params = Globals.Plugins.filter((plugin) ->
   ~/<LunaShaders>/ig.match(plugin.description))[0].parameters;
 }
}

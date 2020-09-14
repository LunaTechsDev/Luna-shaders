import WindowCopyright;
import rm.scenes.Scene_Title;
import utils.Comment;
import core.Types.JsFn;
import utils.Fn;
import rm.Globals;
import rm.managers.FontManager;
import rm.core.JsonEx;
import utils.Parse;

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

class LunaCopyright {
 public static var CParams: CopyrightParams;

 public static function main() {
  Comment.title("Parameters");
  var params = Globals.Plugins.filter((plugin) ->
   ~/<LunaCopyright>/ig.match(plugin.description))[0].parameters;
  CParams = {
   x: Fn.parseIntJs(params["x"]),
   y: Fn.parseIntJs(params["y"]),
   width: Fn.parseIntJs(params["width"]),
   height: Fn.parseIntJs(params["height"]),
   fontSize: Fn.parseIntJs(params["fontSize"]),
   fontFace: untyped params["fontFace"].trim(),
   copyrightText: untyped params["copyrightText"].trim()
  };

  trace(CParams);

  Comment.title("Scene_Title");

  var _SceneTitleCreate: JsFn = Fn.proto(Scene_Title).createR;
  Fn.proto(Scene_Title).createD = () -> {
   _SceneTitleCreate.call(Fn.self);
   createCopyrightWindow(Fn.self);
  };
 }

 public static function createCopyrightWindow(scene: Scene_Title) {
  scene.addWindow(new WindowCopyright(CParams.x, CParams.y, CParams.width,
   CParams.height));
 }
}

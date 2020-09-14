import rm.core.Rectangle;
import rm.windows.Window_Base;

class WindowCopyright extends Window_Base {
 public function new(x: Int, y: Int, width: Int, height: Int) {
  #if compileMV
  super(x, y, width, height);
  #else
  var rect = new Rectangle(x, y, width, height);
  super(rect);
  #end
  this.setBackgroundType(2);
 }

 public function paint() {
  if (this.contents != null) {
   this.contents.clear();
   this.drawVersionText();
  }
 }

 public function drawVersionText() {
  this.contents.fontSize = LunaCopyright.CParams.fontSize;
  var fontFace = LunaCopyright.CParams.fontFace;
  if (fontFace != null || fontFace.length > 0) {
   this.contents.fontFace = fontFace;
  }
  this.drawText(LunaCopyright.CParams.copyrightText, 0, 0,
   this.contentsWidth(), "left");
 }

 public override function update() {
  super.update();
  this.paint();
 }
}

package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class PanelInterface extends Sprite
	{
		var bg:Shape = new Shape();
		var rose:Shape = new Shape();
		var bg_color:uint = 0xFFFAAA;
		
		public function PanelInterface()
		{
			bg.graphics.beginFill(bg_color);
			bg.graphics.drawRect(27,36,160,261);
			addChild(bg);
			
		}
	}
}
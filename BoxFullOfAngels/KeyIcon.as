package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.text.*;
	
	public class KeyIcon extends SimpleButton
	{
		var code:TextField = new TextField();
		var codeStyle:TextFormat = new TextFormat();
		
		public function KeyIcon()
		{
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		private function handleClick(e:MouseEvent):void
		{
			var dream:Dream = new Dream();
			visible = false;
			code.text = "Ya'aqov ben Yehuda";
			code.x = 5; code.y = 5;
			setCodeStyle()
			parent.parent.addChild(dream);
			parent.addChild(code);
			stage.frameRate = 12;
			
		}
		
		private function setCodeStyle()
		{
			with (code)
			{
				name = "key word";
				width = 180;
				height = 40;
				x = 5;
				y = 8;
			}
			
			with (codeStyle)
			{
				color = 0x000000;
				font = "Univers";
				size = 14;
				
			}
			
			code.setTextFormat(codeStyle);
		}
	}
}
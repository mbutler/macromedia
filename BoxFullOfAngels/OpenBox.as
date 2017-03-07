package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class OpenBox extends Sprite
	{
		public function OpenBox()
		{
			x = 300; y = 100;
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function pickup(e:MouseEvent) : void
		{
			e.currentTarget.startDrag();
		}
		
		private function drop(e:MouseEvent) : void
		{
			e.currentTarget.stopDrag();
		}
	}
}
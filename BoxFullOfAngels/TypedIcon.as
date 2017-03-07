package
{
	import flash.display.*;
	import flash.events.*;
	
	public class TypedIcon extends Sprite
	{
		public function TypedIcon()
		{
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
		}
		
		private function handleOver(e:MouseEvent)
		{
			var typed:Typed = new Typed();
			addChild(typed);
			typed.x = 90; typed.y = 0;
			addEventListener(MouseEvent.MOUSE_OUT, handleOut);
		}
		
		private function handleOut(e:MouseEvent)
		{
			removeChildAt(1);
		}
	}
}
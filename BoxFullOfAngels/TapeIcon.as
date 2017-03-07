package
{
	import flash.display.*;
	import flash.events.*;
	
	public class TapeIcon extends Sprite
	{
		public function TapeIcon()
		{
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
		}
		
		private function handleOver(e:MouseEvent)
		{
			var tapes:Tapes = new Tapes();
			addChild(tapes);
			tapes.x = 120; tapes.y = -20;
			addEventListener(MouseEvent.MOUSE_OUT, handleOut);
		}
		
		private function handleOut(e:MouseEvent)
		{
			removeChildAt(1);
		}
	}
}
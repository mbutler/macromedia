package
{
	import flash.display.*;
	import flash.events.*;
	
	public class HandIcon extends Sprite
	{
		public function HandIcon()
		{
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
		}
		
		private function handleOver(e:MouseEvent)
		{
			var hand:Hand = new Hand();
			addChild(hand);
			hand.x = 120; hand.y = -35;
			addEventListener(MouseEvent.MOUSE_OUT, handleOut);
		}
		
		private function handleOut(e:MouseEvent)
		{
			removeChildAt(1);
		}
	}
}
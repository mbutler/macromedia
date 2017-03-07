package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class OpenBox1 extends Sprite
	{
		var icon1:TapeIcon = new TapeIcon();
		var icon2:TypedIcon = new TypedIcon();
		var icon3:HandIcon = new HandIcon();
		var exit:RedButton = new RedButton();
		
		public function OpenBox1()
		{
			x = 300; y = 100;
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, drop);
			
			addChild(icon1);
			icon1.x = 140; icon1.y = 275;
			
			addChild(icon2);
			icon2.x = 170; icon2.y = 275;
			
			addChild(icon3);
			icon3.x = 140; icon3.y = 310;
			
			addChild(exit);
			exit.x = 242; exit.y = 13;
		}
		
		private function pickup(e:MouseEvent) : void
		{
			e.currentTarget.startDrag();
			e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
		}
		
		private function drop(e:MouseEvent) : void
		{
			e.currentTarget.stopDrag();
		}
	}
}
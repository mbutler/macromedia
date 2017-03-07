package
{
	import flash.display.*;
	import flash.events.*;
	
	public class OpenBox2 extends Sprite
	{
		var icon1:NBIcon = new NBIcon("B2N1");
		var icon2:NBIcon = new NBIcon("B2N2");
		var icon3:NBIcon = new NBIcon("B2N3");
		var exit:RedButton = new RedButton();
		
		public function OpenBox2()
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
package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class OpenBox4 extends Sprite
	{
		var icon1:LetterIcon = new LetterIcon("B4L1");
		var icon2:LetterIcon = new LetterIcon("B4L2");
		var icon3:LetterIcon = new LetterIcon("B4L3");
		var icon4:LetterIcon = new LetterIcon("B4L4");
		var icon5:LetterIcon = new LetterIcon("B4L5");
		var icon6:LetterIcon = new LetterIcon("B4L6");
		var icon7:LetterIcon = new LetterIcon("B4L7");
		var icon8:LetterIcon = new LetterIcon("B4L8");
		var exit:RedButton = new RedButton();
		
		public function OpenBox4()
		{
			x = 300; y = 100;
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, drop);
			
			addChild(icon1);
			icon1.x = 140; icon1.y = 275;
			
			addChild(icon2);
			icon2.x = 170; icon2.y = 275;
			
			addChild(icon3);
			icon3.x = 200; icon3.y = 275;
			
			addChild(icon4);
			icon4.x = 230; icon4.y = 275;
			
			addChild(icon5);
			icon5.x = 140; icon5.y = 310;
			
			addChild(icon6);
			icon6.x = 170; icon6.y = 310;
			
			addChild(icon7);
			icon7.x = 200; icon7.y = 310;
			
			addChild(icon8);
			icon8.x = 230; icon8.y = 310;
			
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
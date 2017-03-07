package
{
	import flash.display.*;
	import flash.events.*;
	
	public class LetterIcon extends Sprite
	{
		var myName:String;
		
		public function LetterIcon(letterName:String)
		{
			myName = letterName;
			doubleClickEnabled = true;
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
			addEventListener(MouseEvent.DOUBLE_CLICK, doubleClick);
		}
		
		private function handleOver(e:MouseEvent)
		{
			switch (myName)
			{
				case "B4L1":
				var b4l1:B4L1 = new B4L1();
				b4l1.x = 120; b4l1.y = -10;
				addChild(b4l1);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L2":
				var b4l2:B4L2 = new B4L2();
				b4l2.x = 90; b4l2.y = -10;
				addChild(b4l2);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L3":
				var b4l3:B4L3 = new B4L3();
				b4l3.x = 60; b4l3.y = -10;
				addChild(b4l3);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L4":
				var b4l4:B4L4 = new B4L4();
				b4l4.x = 30; b4l4.y = -10;
				addChild(b4l4);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L5":
				var b4l5:B4L5 = new B4L5();
				b4l5.x = 120; b4l5.y = -45;
				addChild(b4l5);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L6":
				var b4l6:B4L6 = new B4L6();
				b4l6.x = 90; b4l6.y = -45;
				addChild(b4l6);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L7":
				var b4l7:B4L7 = new B4L7();
				b4l7.x = 60; b4l7.y = -45;
				addChild(b4l7);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B4L8":
				var b4l8:B4L8 = new B4L8();
				b4l8.x = 30; b4l8.y = -45;
				addChild(b4l8);
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
			}
			
		}
		
		private function doubleClick(e:MouseEvent):void
		{
			switch (myName)
			{
				case "B4L1":
				var letter1:Note = new Note("B4L1");
				parent.parent.addChild(letter1);
				break;
				
				case "B4L2":
				var letter2:Note = new Note("B4L2");
				parent.parent.addChild(letter2);
				break;
				
				case "B4L6":
				var letter3:Note = new Note("B4L6");
				parent.parent.addChild(letter3);
				break;
				
				case "B4L7":
				var letter4:Note = new Note("B4L7");
				parent.parent.addChild(letter4);
				break;
				
				case "B4L8":
				var letter5:Note = new Note("B4L8");
				parent.parent.addChild(letter5);
				break;
			}
		}
		
		private function handleOut(e:MouseEvent)
		{
			removeChildAt(1);
		}
		
		
	}
}
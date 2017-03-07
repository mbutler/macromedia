package
{
	import flash.display.*;
	import flash.events.*;
	
	public class NBIcon extends Sprite
	{
		var myName:String;
		
		public function NBIcon(nbName:String)
		{
			myName = nbName;
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
			
		}
		
		private function handleOver(e:MouseEvent)
		{
			switch (myName)
			{
				//------Box 2-------------------
				
				case "B2N1":
				var b2n1:B2N1 = new B2N1();
				addChild(b2n1);
				b2n1.x = 120; b2n1.y = 0;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B2N2":
				var b2n2:B2N2 = new B2N2();
				addChild(b2n2);
				b2n2.x = 90; b2n2.y = 0;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B2N3":
				var b2n3:B2N3 = new B2N3();
				addChild(b2n3);
				b2n3.x = 120; b2n3.y = -35;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				//------Box 3-------------------
				
				case "B3N1":
				var b3n1:B3N1 = new B3N1();
				addChild(b3n1);
				b3n1.x = 120; b3n1.y = 0;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B3N2":
				var b3n2:B3N2 = new B3N2();
				addChild(b3n2);
				b3n2.x = 90; b3n2.y = 0;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B3N3":
				var b3n3:B3N3 = new B3N3();
				addChild(b3n3);
				b3n3.x = 120; b3n3.y = -35;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B3N4":
				var b3n4:B3N4 = new B3N4();
				addChild(b3n4);
				b3n4.x = 90; b3n4.y = -35;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;				
				
				//-------Box 5--------------------
				case "B5N1":
				var b5n1:B5N1 = new B5N1();
				addChild(b5n1);
				b5n1.x = 120; b5n1.y = 0;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B5N2":
				var b5n2:B5N2 = new B5N2();
				addChild(b5n2);
				b5n2.x = 90; b5n2.y = 0;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B5N3":
				var b5n3:B5N3 = new B5N3();
				addChild(b5n3);
				b5n3.x = 120; b5n3.y = -35;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;
				
				case "B5N4":
				var b5n4:B5N4 = new B5N4();
				addChild(b5n4);
				b5n4.x = 90; b5n4.y = -35;
				addEventListener(MouseEvent.MOUSE_OUT, handleOut);
				break;				
			}
		}
		
		private function handleOut(e:MouseEvent)
		{
			removeChildAt(1);
		}
	}
}
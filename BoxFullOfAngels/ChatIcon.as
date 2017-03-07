package
{
	import flash.display.*;
	import flash.events.*;
	
	public class ChatIcon extends Sprite
	{
		var mySwitch:Boolean = false;
		var names:NameChooser = new NameChooser();
		
		public function ChatIcon()
		{
			x = 760; y = 5;
			doubleClickEnabled = true;
			addEventListener(MouseEvent.CLICK, switcher);
		}
		
		//-----HERE'S HOW TO BUILD A FUCKING ON/OFF SWITCH--------
		
		private function switcher(e:MouseEvent)
		{
			if (mySwitch == true)
			{
				removeChild(names);
				mySwitch = false;
								
			} else if (mySwitch == false)
			{
				addChild(names);
				mySwitch = true;
			}
						
		}
	}
}
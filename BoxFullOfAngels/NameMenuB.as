package
{
	import flash.display.*;
	import flash.events.*;
	
	public class NameMenuB extends SimpleButton
	{
		public function NameMenuB()
		{
			x = -150; y = 36;
			addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent)
		{
			var chatB:ChatWindow = new ChatWindow("Walter Benjamin", 180, 180);
			parent.parent.parent.addChild(chatB);
		}
	}
}
package
{
	import flash.display.*;
	import flash.events.*;
	
	public class NameMenuM extends SimpleButton
	{
		public function NameMenuM()
		{
			x = -150; y = 16;
			addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent)
		{
			var chatM:ChatWindow = new ChatWindow("Marshall McLuhan", 190, 180);
			parent.parent.parent.addChild(chatM);
		}
	}
}
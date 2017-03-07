package
{
	import flash.display.*;
	import flash.events.*;
	
	public class RedButton extends SimpleButton
	{
		public function RedButton()
		{
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		
		private function handleClick(event:MouseEvent):void
		{
			parent.parent.removeChild(parent);
			parent.removeEventListener(MouseEvent.CLICK, handleClick);
		}
	}
}
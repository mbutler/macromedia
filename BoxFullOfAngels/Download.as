package
{
	import flash.display.*;
	import flash.events.*;
	
	public class Download extends SimpleButton
	{
		//var iconCheck:CheckIcons = new CheckIcons();
		var icon1:Attachment = new Attachment("Notebook 1", 765, 100);
		var icon2:Attachment = new Attachment("Notebook 2", 765, 200);
		var icon3:Attachment = new Attachment("Notebook 3", 765, 300);
		var mySwitch:Boolean = false;
		
		public function Download()
		{
			//mySwitch = iconCheck.getNoteStatus();
			if (mySwitch == false)
			{
				addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
			}
						
		}
		
		private function mouseHandler(e:MouseEvent):void
		{
			
			mySwitch = true;
			parent.parent.addChildAt(icon1, 1);
			parent.parent.addChildAt(icon2, 1);
			parent.parent.addChildAt(icon3, 1);
			
		}
	}
}
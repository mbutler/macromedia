package 
{
	import flash.events.*;
	
	public class CheckIcons
	{
		public var noteIcons:Boolean = false;
		public var chatIcons:Boolean;
		
		public function CheckIcons()
		{
			
		}
		
		public function setIcons(iconStatus:String)
		{
			if (iconStatus == "note")
			{
				noteIcons = true;
			} else if (iconStatus == "chat")
			{
				chatIcons = true;
			}
		}
		
		public function getChatStatus()
		{
			return chatIcons;
		}
		
		public function getNoteStatus()
		{
			return noteIcons;
		}
	}
}
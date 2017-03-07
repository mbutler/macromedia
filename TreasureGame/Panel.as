package
{
	import flash.display.*;
	import flash.events.*;
	
	public class Panel extends Sprite
	{
		var bg:PanelInterface = new PanelInterface();
		var dive:DiveButton = new DiveButton();
		var locate:LocateButton = new LocateButton();
		var loc:Locations = new Locations();
		
		public function Panel()
		{
			//addChild(bg);
			addChild(dive);
			addChild(locate);
			dive.x = 30; dive.y = 40;
			locate.x = 30; locate.y = 70;
			dive.addEventListener(MouseEvent.MOUSE_DOWN, diveClick);
			locate.addEventListener(MouseEvent.MOUSE_DOWN, locateClick);
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, place);
		}
		
		private function pickup(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function place(e:MouseEvent):void 
		{
			e.currentTarget.stopDrag();
		}
		
		private function diveClick(e:MouseEvent):void
		{
			trace("diving...");
			if (loc.getPlayer1() == loc.getGold())
			{
				trace("Pulling up treasure!!");
			}
		}
		
		private function locateClick(e:MouseEvent):void
		{
			var dir:Direction = new Direction();
			var sender:String = dir.Cardinal(loc.getPlayer1(), loc.getGold());
			trace(sender);
		}
	}
}
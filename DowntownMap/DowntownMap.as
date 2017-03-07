package 
{
	import flash.display.*;
	import flash.events.*;
	
	public class DowntownMap extends Sprite
	{
		var myMap:DrawMap = new DrawMap();
		var mySpots:HotSpots = new HotSpots("Anatomy Building", 600, 300, 30, 30);
		
		public function DowntownMap()
		{
			addChild(myMap);
			addChild(mySpots);
			
		}
	}
}
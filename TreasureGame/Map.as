package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import com.baseoneonline.flash.astar.AStar;
	import com.baseoneonline.flash.astar.AStarNode;
	import com.baseoneonline.flash.geom.IntPoint;
	import src.TileMap;
	
	public class Map
	{
		private var loc:Locations = new Locations();
		private var gold:String = loc.getGold();
		private var silver:String = loc.getSilver();
		private var player:String = loc.getPlayer1();
		private var computer:String = loc.getComputer1();
		private var map:TileMap = new TileMap(24,24); //map dimensions 
		private var tileSize:Number = 25; //square size
		public var solve:Array = new Array();//the public variable 
		public var ports:Array = new Array();
		
		
		public function Map(begin:String,end:String,moves:int)
		{
							
				//set the land squares
				placeLand(map);
								
				//convert begin:String algebra to screen coordinates
				var screen:Array = mbutlerString.AlgebraToScreen(begin);		
				
				//convert screen coordinates to a Point() 
				var point:Point = new Point(screen[0],screen[1]);
				
				//convert Point() to IntPoint()
				var start = screenToMap(point);
				
				//convert end:String algebra to screen coordinates
				var screen2:Array = mbutlerString.AlgebraToScreen(end);		
				
				//convert screen coordinates to a Point()
				var point2:Point = new Point(screen2[0],screen2[1]);
				
				//convert Point() to IntPoint()
				var goal = screenToMap(point2);
				
				//make a new solver and store results in an Array
				var a:AStar = new AStar(map, start, goal);
				var solution:Array = a.solve();
				
				//rearrange results to suit the parameters
				solution.pop(); //takes a duplicate off the end
				//solution.push(start); //toggles between adding starting square to the path
				solution.reverse(); //after working backwards it flips the array to appear like it's starting
				
				//only returns the amount requested
				var sender:Array = solution.slice(0,moves);
				
				//public variable
				solve = sender;
								
		}
		
	
		private function screenToMap(p:Point):IntPoint
		{
			return new IntPoint( Math.floor(p.x/tileSize), Math.floor(p.y/tileSize) );
		}
		
		private function mapToScreen(p:IntPoint):Point
		{
			return new Point( (p.x*tileSize)+(tileSize/2), (p.y*tileSize)+(tileSize/2) );
		}
		
		
		
		//LAND
		private function placeLand(map:TileMap):void
		{
			
			map.setWalkable(9,1,false);
			map.setWalkable(10,1,false);
			map.setWalkable(9,2,false);
			map.setWalkable(10,2,false);
			map.setWalkable(11,3,false);
			map.setWalkable(12,3,false);
			map.setWalkable(14,3,false);
			map.setWalkable(15,3,false);
			map.setWalkable(17,3,false);
			map.setWalkable(18,3,false);
			map.setWalkable(10,4,false);
			map.setWalkable(11,4,false);
			map.setWalkable(12,4,false);
			map.setWalkable(14,4,false);
			map.setWalkable(15,4,false);
			map.setWalkable(17,4,false);
			map.setWalkable(18,4,false);
			map.setWalkable(19,4,false);
			//map.setWalkable(10,5,false);
			map.setWalkable(11,5,false);
			map.setWalkable(12,5,false);
			map.setWalkable(14,5,false);
			map.setWalkable(15,5,false);
			map.setWalkable(18,5,false);
			map.setWalkable(19,5,false);
			map.setWalkable(20,5,false);
			map.setWalkable(21,5,false);
			map.setWalkable(16,6,false);
			map.setWalkable(19,6,false);
			map.setWalkable(20,6,false);
			map.setWalkable(21,6,false);
			map.setWalkable(16,7,false);
			map.setWalkable(15,8,false);
			map.setWalkable(16,8,false);
			map.setWalkable(1,9,false);
			map.setWalkable(2,9,false);
			//map.setWalkable(15,9,false);
			map.setWalkable(16,9,false);
			map.setWalkable(19,9,false);
			map.setWalkable(20,9,false);
			map.setWalkable(1,10,false);
			map.setWalkable(2,10,false);
			map.setWalkable(19,10,false);
			map.setWalkable(20,10,false);
			map.setWalkable(1,11,false);
			map.setWalkable(2,11,false);
			//map.setWalkable(11,11,false);
			map.setWalkable(12,11,false);
			map.setWalkable(19,11,false);
			map.setWalkable(20,11,false);
			map.setWalkable(1,12,false);
			map.setWalkable(2,12,false);
			map.setWalkable(11,12,false);
			map.setWalkable(12,12,false);
			map.setWalkable(3,14,false);
			map.setWalkable(4,14,false);
			map.setWalkable(5,14,false);
			map.setWalkable(18,14,false);
			map.setWalkable(19,14,false);
			map.setWalkable(20,14,false);
			map.setWalkable(3,15,false);
			map.setWalkable(4,15,false);
			map.setWalkable(5,15,false);
			map.setWalkable(18,15,false);
			map.setWalkable(19,15,false);
			map.setWalkable(20,15,false);
			map.setWalkable(19,16,false);
			map.setWalkable(20,16,false);
			map.setWalkable(6,17,false);
			//map.setWalkable(7,17,false);
			map.setWalkable(8,17,false);
			map.setWalkable(14,17,false);
			map.setWalkable(15,17,false);
			map.setWalkable(17,17,false);
			map.setWalkable(18,17,false);
			map.setWalkable(6,18,false);
			map.setWalkable(7,18,false);
			map.setWalkable(8,18,false);
			map.setWalkable(14,18,false);
			map.setWalkable(15,18,false);
			map.setWalkable(17,18,false);
			map.setWalkable(18,18,false);
			map.setWalkable(20,18,false);
			map.setWalkable(21,18,false);
			map.setWalkable(20,19,false);
			map.setWalkable(21,19,false);
			map.setWalkable(12,20,false);
			map.setWalkable(13,20,false);
			map.setWalkable(14,20,false);
			map.setWalkable(15,20,false);
			map.setWalkable(16,20,false);
			map.setWalkable(20,20,false);
			map.setWalkable(21,20,false);
			map.setWalkable(14,21,false);
			map.setWalkable(15,21,false);
			map.setWalkable(16,21,false);
			map.setWalkable(20,21,false);
			map.setWalkable(21,21,false);
			
		}
		
	}
}
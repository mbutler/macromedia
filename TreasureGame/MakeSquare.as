package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import com.baseoneonline.flash.astar.AStar;
	import com.baseoneonline.flash.astar.AStarNode;
	import com.baseoneonline.flash.geom.IntPoint;
	import src.TileMap;	
	
	
	public class MakeSquare extends Sprite
	{
		//SquareFill() is declared in the Flash library
		var square:SimpleButton = new SquareFill();
		var loc:Locations = new Locations();
		var boat_offset:int = 8;
		var player1_stats:Player1Stats = new Player1Stats();
		var checker:SquareCheck = new SquareCheck();
		var fuel:uint;
				
		public function MakeSquare()
		{
			addEventListener(MouseEvent.MOUSE_OVER, overBox);
			addEventListener(MouseEvent.MOUSE_DOWN, downBox);
			
			addChild(square);
		}
		
		
		
		private function overBox(e:MouseEvent):void
		{
						
			if (loc.getTurn() > 1 && checker.IsLand(e.currentTarget.name) !== true)
			{
				
				var fuel_check:Map = new Map(loc.getPlayer1(),e.currentTarget.name, 99);
				var fuel_amount:Array = fuel_check.solve;
				fuel = fuel_amount.length;
				trace("FUEL: "+fuel);				
							
			}			
			
		}
		
		
		private function downBox(e:MouseEvent):void
		{
			var checker:SquareCheck = new SquareCheck();
			var loc:Locations = new Locations();
						
			if (checker.IsPort(e.currentTarget.name) == true && loc.getTurn() == 1) // Must begin Turn 1 on a port
				{
					//MOVES THE PLAYER BOAT SPRITE TO THE PLAYER'S GRID LOCATION
					var foo = loc.setPlayer1(e.currentTarget.name);
					stage.getChildByName("player boat").x = stage.getChildByName(loc.getPlayer1()).x;
					stage.getChildByName("player boat").y = stage.getChildByName(loc.getPlayer1()).y + boat_offset;
					
					//MOVES THE COMPUTER BOAT SPRITE TO THE COMPUTER'S GRID LOCATION
					
					var comp_port = RandomSquare.pickPort();
					loc.setComputer1(comp_port);
					stage.getChildByName("computer boat").x = stage.getChildByName(comp_port).x;
					stage.getChildByName("computer boat").y = stage.getChildByName(comp_port).y + boat_offset;
					
					loc.setTurn(2);
					
				}
			
			
			if (checker.IsLand(e.currentTarget.name) == true) //If it's land don't move there but turn on the level editor
			{
				//var level:LevelEditor = new LevelEditor(e.currentTarget.name);
								
			} else 	if (loc.getTurn() > 1) // If it's past the first turn move around the ocean and ports
				{
									
					var map:Map = new Map(loc.getPlayer1(),e.currentTarget.name, 20);
					var solution:Array = map.solve;
					//trace("path: "+solution);
					
					if (checker.IsBoat(e.currentTarget.name) == true) // If it's another boat then space the boats out nicely
						{
							//LANDING ON ANOTHER PLAYER SQUARE
							//MOVES THE PLAYER BOAT SPRITE TO THE PLAYER'S GRID LOCATION
							var foo3 = loc.setPlayer1(e.currentTarget.name);
							stage.getChildByName("player boat").x = stage.getChildByName(loc.getPlayer1()).x;
							stage.getChildByName("player boat").y = stage.getChildByName(loc.getPlayer1()).y;
						
							//MOVES THE COMPUTER BOAT SPRITE TO THE COMPUTER'S GRID LOCATION
							stage.getChildByName("computer boat").x = stage.getChildByName(loc.getComputer1()).x;
							stage.getChildByName("computer boat").y = stage.getChildByName(loc.getComputer1()).y + boat_offset*2;
						} else
						{
							//LANDING ON AN OCEAN SQUARE
							//MOVES THE PLAYER BOAT SPRITE TO THE PLAYER'S GRID LOCATION
														
							if (fuel <= player1_stats.getFuel())
							{
								var foo4 = loc.setPlayer1(e.currentTarget.name);
								trace(fuel+" litres of fuel used");
								var foo5 = player1_stats.setFuel((player1_stats.getFuel()-fuel)) ;
								trace("current fuel: "+player1_stats.getFuel());
								stage.getChildByName("player boat").x = stage.getChildByName(loc.getPlayer1()).x;
								stage.getChildByName("player boat").y = stage.getChildByName(loc.getPlayer1()).y + boat_offset;
							}
							
						
						}
				} 
		  }
	}
}
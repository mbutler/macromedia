package
{
	import flash.display.*;
	import flash.events.*;
	
		
	public class TreasureGame extends Sprite
	{
		var bg:Sprite = new Background();
		var i; var j; var k = 0;
		var rows = 24; var columns = 24;
		var spacing = 25;
		var v = 25; var h = 25;
		var l = 96;
		var str; var boxname;
		
		
		var player_boat:MakeBoat = new MakeBoat(0xbd2727, "player boat");
		var computer_boat:MakeBoat = new MakeBoat(0x000000, "computer boat");
					
		//STARTING TREASURE LOCATION
		private var goldSpot = RandomSquare.pickGold();
		private var silverSpot = RandomSquare.pickSilver();
		
		//THE LOC OBJECT HANDLES ALL GETTING AND SETTING
		private var loc:Locations = new Locations();
				
		//SET GOLD AND SILVER LOCATIONS - WHY THE FOO VARS ARE NECESSARY, I DON'T KNOW.  
		private var foo = loc.setGold(goldSpot);
		private var foo2 = loc.setSilver(silverSpot);
		
		//SET PLAYER LOCATION IN GRID
		private var playerSpot = loc.getPlayer1();
		private var foo3 = loc.setPlayer1(playerSpot);
		
		private var ports = loc.getPorts();
		
		
		
		public function TreasureGame()
		{
			//BACKGROUND
			addChild(bg);		
			drawGrid();			
			init();
			loc.setTurn(1);
			loc.setPanelX(300);
			loc.setPanelY(150);

			stage.addChild(player_boat);
			stage.addChild(computer_boat);
			player_boat.name = ("player boat")
			computer_boat.name = ("computer boat");
			player_boat.x = -80; player_boat.y = -50;
			computer_boat.x = -50; computer_boat.y = -50;			
			var r = loc.setTurn(1);
			trace("turn: "+loc.getTurn());
						
		}
		
		private function init()
		{
			var p_stats:Player1Stats = new Player1Stats();
			
			p_stats.setDivers(0);
			p_stats.setEngines(0);
			p_stats.setCargo(0);
			p_stats.setFuel(20);
			p_stats.setMines(0);
			p_stats.setCash(0);
			p_stats.setChests(0);
			p_stats.setPhase("move");
			
			var c_stats:Computer1Stats = new Computer1Stats();
			
			c_stats.setDivers(0);
			c_stats.setEngines(0);
			c_stats.setCargo(0);
			c_stats.setFuel(0);
			c_stats.setMines(0);
			c_stats.setCash(0);
			c_stats.setChests(0);
			c_stats.setPhase("move");
			
			
			
		}
		
			
		private function drawGrid()
		{
			var loc:Locations = new Locations();
			var p:Array = loc.getPorts();
			var port_color:uint = 0xcfda71;
			var borderColor:uint  = 0x000000;
			
			
			for (i = 1; i <= columns; i++)
			{
				l++; str = String.fromCharCode(l); 
				
				
				for (j = 1; j <= rows; j++)
				{
					k++;
					
					if (k == 25)
					{
						k = 1;
					}
					
					boxname = str + k;
					var box:MakeSquare = new MakeSquare();
					box.name = boxname;
					box.x = h * (j - 1);
					box.y = v * (i - 1);
					
					stage.addChild(box);
					
					//loops through the number of ports in array and adds them to the box				
					for (var m = 0; m < p.length; m++)
					{
						
						if (box.name == p[m])
						{
							var port:Shape = new Shape();
							port.graphics.beginFill(port_color);
							port.graphics.lineStyle(0.5, borderColor);
							port.graphics.drawCircle(x+13,parent.y+13,8);
							port.graphics.endFill();
							box.addChild(port);
														
						}
					} 
				}
				
			}
		}
		
		
			
	}
}
package
{
	import flash.display.*;
	
	public class Move extends Sprite
	{
		var loc:Locations = new Locations();
		var turn:uint = loc.getTurn();
		
		
		
		public function Move()
		{
			if (turn == 1)
			{
				drawBoats();
			}
			
		}
		
		private function drawBoats()
			{
				//PLAYER BOAT
				addChild(player_boat);
				addChild(player_boat);
				player_boat.name = "player boat";
				
				
				//COMPUTER BOAT
				//addChild(computer_boat);
				//addChild(computer_boat);
				//computer_boat.name = "computer boat";
				//computer_boat.x = -50; computer_boat.y = 50;
			}
	}
}
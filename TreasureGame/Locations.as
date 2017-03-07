package
{
	public class Locations
	{
		
		//make STATIC vars for get/set classes
		private static var turn:uint;
		private static var panelX:int;
		private static var panelY:int;
		private static var gold:String;
		private static var silver:String;
		private static var player:String;
		private static var computer:String;
		private static var ports:Array = new Array("r8","f11","j16","l12");
		
						
		//GOLD LOCATION
		public function getGold()
		{
			return gold;
	
		}
		
		public function setGold(loc:String)
		{
			gold = loc;
			
		}
		
		//SILVER LOCATION
		public function getSilver()
		{
			return silver;
	
		}
		
		public function setSilver(loc:String)
		{
			silver = loc;
			
		}
		
		//PLAYER LOCATION ON GRID 
		public function setPlayer1(loc:String)
		{
			player = loc;
		}
		
		public function getPlayer1()
		{
			return player;
		}
		
		//COMPUTER LOCATION ON GRID 
		public function setComputer1(loc:String)
		{
			computer = loc;
		}
		
		public function getComputer1()
		{
			return computer;
		}
		
		//PORT LOCATIONS
		public function getPorts()
		{
			return ports;
		}
		
		//ROUND NUMBER
		public function getTurn()
		{
			return turn;
		}
		
		public function setTurn(num:uint)
		{
			turn = num;
		}
		
		public function getPanelX()
		{
			return panelX;
		}
		
		public function getPanelY()
		{
			return panelY;
		}
		
		public function setPanelX(myX)
		{
			panelX = myX;
		}
		
		public function setPanelY(myY)
		{
			panelY = myY;
		}
		
				
				
	}
}
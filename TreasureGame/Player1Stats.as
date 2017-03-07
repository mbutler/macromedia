package
{
	public class Player1Stats
	{
		private static var divers:uint;
		private static var engines:uint;
		private static var cargo:uint;
		private static var fuel:uint;
		private static var mines:uint;
		private static var cash:uint;
		private static var chests:uint;
		private static var phase:String;
		
		public function getDivers()
		{
			return divers; 
		}
		
		public function setDivers(num:uint)
		{
			divers = num;
		}
		
		public function getEngines()
		{
			return engines;
		}
		
		public function setEngines(num:uint)
		{
			engines = num;
		}
		
		public function getCargo()
		{
			return cargo;
		}
		
		public function setCargo(num:uint)
		{
			cargo = num;
		}
		
		public function getFuel()
		{
			return fuel;
		}
		
		public function setFuel(num:uint)
		{
			fuel = num;
		}
		
		public function getMines()
		{
			return mines;
		}
		
		public function setMines(num:uint)
		{
			mines = num;
		}
		
		public function getCash()
		{
			return cash;
		}
		
		public function setCash(num:uint)
		{
			cash = num;
		}
		
		public function getChests()
		{
			return chests;
		}
		
		public function setChests(num:uint)
		{
			chests = num;
		}
		
		public function getPhase()
		{
			return phase;
		}
		
		public function setPhase(type:String)
		{
			phase = type;
		}
	}
}
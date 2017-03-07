package
{
	public class RandomSquare //returns a random square on a 24x24 grid with algebraic notation
	{
		
		
		public static function pickGold()
		{
			//picks a random number between 97 and 120
			var uniNum:int = Math.ceil(Math.random()*24 + 96);
			
			//picks a random number between 1 - 24
			var topNum:int = Math.ceil(Math.random()*24);
			
			//turns uniNum into a letter based on unicode and concats with topNum
			var goldSpot:String; 
			goldSpot = String.fromCharCode(uniNum) + topNum;
			
			//checks to see if the chosen square is land.  If true, keeps trying until it's ocean.
			var checker:SquareCheck = new SquareCheck();
			if (checker.IsLand(goldSpot) == true)
			{
				
				goldSpot = RandomSquare.pickGold();
				
				
			}
			
			return goldSpot;
			
		}
		
		public static function pickSilver()
		{
			//picks a random number between 97 and 120
			var uniNum:int = Math.ceil(Math.random()*24 + 96);
			
			//picks a random number between 1 - 24
			var topNum:int = Math.ceil(Math.random()*24);
			
			//turns uniNum into a letter based on unicode and concats with topNum
			var silverSpot:String; 
			silverSpot = String.fromCharCode(uniNum) + topNum;
			
			//checks to see if the chosen square is land.  If true, keeps trying until it's ocean.
			var checker:SquareCheck = new SquareCheck();
			if (checker.IsLand(silverSpot) == true)
			{
				
				silverSpot = RandomSquare.pickSilver();
				
				
			}
			
			return silverSpot;
			
		}
		
		public static function pickPort()
		{
			var checker:SquareCheck = new SquareCheck();
			var loc:Locations = new Locations();
			var ports:Array = loc.getPorts();
			ports.splice(ports.indexOf(loc.getPlayer1()),1);
			var i;
			var rand:int = Math.ceil(Math.random()*ports.length-1);
			return ports[rand];			
			
		}
		
			
	}
}
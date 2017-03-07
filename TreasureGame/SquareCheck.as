package
{
	public class SquareCheck  // Checks to see if a square is land
	{
		private var loc:Locations = new Locations();
		
		public function SquareCheck()
		{
			
		}
		public function IsLand(square:String) 
			{
				var land:Array = new Array("b10","b11","c10","c11","d12","d13","d15","d16","d18","d19","e11","e12","e13","e15","e16","e18","e19","e20","f12","f13","f15","f16","f19","f20","f21","f22","g2","g22","g21",
						   "g20","g17","h17","i17","i16","j2","j3","j17","j20","j21","k21","k20","k3","k2","l2","l3","l13","l20","l21","m13","m12","m3","m2","o4","o5","o6","o19","o20","o21","p21",
						   "p20","p19","p6","p5","p4","q20","q21","r19","r18","r16","r15","r9","r7","s7","s8","s9","s15","s16","s18","s19","s21","s22","t21","t22","u13","u14","u15","u16","u17","u21","u22",
						   "v22","v21","v17","v16","v15");
				var i;
				
				for (i = 0; i < land.length; i++)
				{
					if (square == land[i])
					 {
						 
						return true;
						
						 
					 } 
											
									
				}
				
			
			}
			
			public function IsBoat(square:String)
			{
				var i;
				
				if (square == loc.getComputer1())
				{
					return true;
				}
			}
			
			public function IsPort(square:String)
			{
				var i;
				var ports:Array = loc.getPorts();
				
				for (i=0; i<ports.length; i++)
				{
					if (square == ports[i])
					{
						return true;
					}
				}
			}
			
			
	}

}






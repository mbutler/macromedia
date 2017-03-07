package
{
	public class Direction
	{
		//Cardinal takes a beginning square and returns the direction an ending square is in.
		
		public function Cardinal(begin:String, end:String)
		{
			var beginLetter:String;
			var tmp:String;
			var beginNumber:uint
			var endLetter:String;
			var endNumber:uint;
			var tmp2:String;
			var ns:String;
			var ew:String;
			var heading:String; //the direction the boat is pointing
			
			beginLetter = begin.charAt(0);
			tmp = begin.substr(1,2);
			beginNumber = uint(tmp);
			
			endLetter = end.charAt(0);
			tmp2 = end.substr(1,2);
			endNumber = uint(tmp2);
			
			
			if (endLetter < beginLetter)
			{
				ns = "north";
			} else if (endLetter > beginLetter)
			{
				ns = "south";
			} else 
			{
				ns = "";
			}
			
			if (endNumber < beginNumber)
			{
				ew = "west";
			} else if (endNumber > beginNumber)
			{
				ew = "east";
			} else
			{
				ew = "";
			}
			
			heading = ns + ew;
			return heading;
			
			
		}
		
	}
}
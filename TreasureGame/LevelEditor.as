package
{
	public class LevelEditor
	{
		public function LevelEditor(square:String)
		{
			// A RUDIMENTARY LEVEL EDITOR
			var L = square.charAt(0);
			var N = square.substr(1,2);
			var Lnum = mbutlerString.ToUnicodeNum(L);
			Lnum -= 97;
			N = uint(N-1);
			trace("map.setWalkable("+N+","+Lnum+",false);")
								
		}
	}
}
package
{
	import flash.display.*;
	import flash.events.*;
	
	public class NameChooser extends Sprite
	{
		var mm:NameMenuM = new NameMenuM();
		var wb:NameMenuB = new NameMenuB();
		
		public function NameChooser()
		{
			addChild(mm);
			addChild(wb);
		}
		
	}
}
package
{
	import flash.display.*;
	import flash.net.URLRequest;
	
	public class ImageLoader extends Sprite
	{
		public function ImageLoader(imageName)
		{
			var loader:Loader = new Loader();
			
			addChild(loader);
			
			loader.load(new URLRequest(imageName));
		}
	}
}
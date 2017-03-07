package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.net.URLRequest;
		
	public class Boot extends Sprite
	{
		var bootLoader:Loader = new Loader();
		var bootRequest:URLRequest = new URLRequest("boot.swf");
		
		public function Boot()
		{
			StartLoad();
		}
		
		public function StartLoad()
		{
			bootLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			bootLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			bootLoader.load(bootRequest);
		}
		
		function onCompleteHandler(e:Event)
		{
				addChild(e.currentTarget.content);
		}
		
		function onProgressHandler(e:ProgressEvent)
		{
				var percent:Number = e.bytesLoaded/e.bytesTotal;
				
		}
	}
}
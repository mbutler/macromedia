package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.net.URLRequest;
		
	public class Dream extends Sprite
	{
		var dreamLoader:Loader = new Loader();
		var dreamRequest:URLRequest = new URLRequest("dream.swf");
		
		public function Dream()
		{
			StartLoad();
		}
		
		public function StartLoad()
		{
			dreamLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			dreamLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			dreamLoader.load(dreamRequest);
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
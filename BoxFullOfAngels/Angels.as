package
{
	import flash.display.*;
	import flash.utils.Timer;
	import flash.events.*;
	import flash.net.*;
	import flash.media.Sound;
	import flash.events.*;
	import flash.ui.*;
				
	public class Angels extends Sprite
	{
		var chatIcon:ChatIcon = new ChatIcon();
		var bg:Sprite = new MainBackground();
		var date:DateThing = new DateThing();
				
		//var soundLoad:URLRequest = new URLRequest("open.mp3");
		//var openSound:Sound = new Sound();
		
		var radio:Radio = new Radio();
		
		var bootScreen:Boot = new Boot();
		
		var box1:Box = new Box("Box 1", 900, 100);
		var box2:Box = new Box("Box 2", 900, 200);
		var box3:Box = new Box("Box 3", 900, 300);
		var box4:Box = new Box("Box 4", 900, 400);
		var box5:Box = new Box("Box 5", 900, 500);
		
		var email:EmailIcon = new EmailIcon("Mail", 915, 600);
		
		public function Angels()
		{
			
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			Mouse.hide();
			addChild(bootScreen);
			
			
			
			var timer:Timer = new Timer(30000,1); //uncomment this line to run boot menu
			//var timer:Timer = new Timer(200,1); //uncomment this line to skip boot menu
			timer.addEventListener(TimerEvent.TIMER, addWindow);
			timer.start();
			
			var bootTimer:Timer = new Timer(27083,1);  //uncomment this line to run boot menu
			//var bootTimer:Timer = new Timer(5,1);  //uncomment this line to skip boot menu
			bootTimer.addEventListener(TimerEvent.TIMER, removeBoot);
			bootTimer.start();
							
		}
		
			
		private function addWindow(e:TimerEvent):void
		{
			//openSound.load(soundLoad);
			//openSound.play();
			addChild(date);
			addChild(radio);
			addChild(box1);
			addChild(box2);
			addChild(box3);
			addChild(box4);
			addChild(box5);
			addChild(email);
			addChild(chatIcon);
			
			stage.frameRate = 30;
		}
		
		private function removeBoot(e:TimerEvent):void
		{
			removeChild(bootScreen);
			var pauseTimer:Timer = new Timer(9,1);
			pauseTimer.addEventListener(TimerEvent.TIMER, addBg);
			pauseTimer.start();
		}
		
		private function addBg(e:TimerEvent)
		{
			addChild(bg);
			Mouse.show();
		}
		
		
	}
}

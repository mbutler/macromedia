package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.net.*;
	
	public class Note extends MovieClip
	{
		private var writing:TextField = new TextField();
		private var writingStyle:TextFormat = new TextFormat();
		private var loader1:URLLoader = new URLLoader();
		private var loader2:URLLoader = new URLLoader();
		private var loader3:URLLoader = new URLLoader();
		private var loader4:URLLoader = new URLLoader();
		private var loader5:URLLoader = new URLLoader();
		private var loader6:URLLoader = new URLLoader();
		private var loader7:URLLoader = new URLLoader();
		private var loader8:URLLoader = new URLLoader();
		private var exit:RedButton = new RedButton();
		private var copy:String;
		private var myName:String;
		var key:KeyIcon = new KeyIcon();
		
		public function Note(noteName:String)
		{
			myName = noteName;
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, place);
			addEventListener(Event.ADDED, added);
			addChild(exit);
			addChild(writing);
			exit.x = 405; exit.y = 5;
			x = 300; y = 100;
				
		}
		
		private function added(e:Event) : void
		{
			switch (myName)
			{
				case "Notebook 1":
				loader1.load(new URLRequest("note1.txt"));
				loader1.addEventListener(Event.COMPLETE, onLoaded);	
				addChild(key);
				key.x = 10; key.y = 10;
				break;
				
				case "Notebook 2":
				loader2.load(new URLRequest("note2.txt"));
				loader2.addEventListener(Event.COMPLETE, onLoaded);	
				break;
				
				case "Notebook 3":
				loader3.load(new URLRequest("note3.txt"));
				loader3.addEventListener(Event.COMPLETE, onLoaded);	
				break;
				
				case "B4L1":
				loader4.load(new URLRequest("b4l1.txt"));
				loader4.addEventListener(Event.COMPLETE, onLoaded);
				break;
				
				case "B4L2":
				loader5.load(new URLRequest("b4l2.txt"));
				loader5.addEventListener(Event.COMPLETE, onLoaded);
				break;
				
				case "B4L6":
				loader6.load(new URLRequest("b4l6.txt"));
				loader6.addEventListener(Event.COMPLETE, onLoaded);
				break;
				
				case "B4L7":
				loader7.load(new URLRequest("b4l7.txt"));
				loader7.addEventListener(Event.COMPLETE, onLoaded);
				break;
				
				case "B4L8":
				trace("b4l8");
				loader8.load(new URLRequest("b4l8.txt"));
				loader8.addEventListener(Event.COMPLETE, onLoaded);
				break;
			}
		}
		
		private function onLoaded(e:Event):void
		{
			copy = e.target.data;
			copy = copy.split("\r\n").join("\n");
			writing.text = copy;
			
			setWritingStyle();
			
		}
		
		
		private function pickup(e:MouseEvent):void 
		{
			if (e.target.name == "writing" || e.target == key || e.target.name == "key word") 
			{} else 
			{
				e.currentTarget.startDrag();
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
			}
		}
		
		private function place(e:MouseEvent):void 
		{
			e.currentTarget.stopDrag();
		}
		
		private function setWritingStyle()
		{
			with (writing)
			{
				name = "writing";
				width = 415;
				height = 500;
				x = 5;
				y = 45;
				background = true;
				wordWrap = true;
				multiline = false;
				TextFieldAutoSize.LEFT
			}
			
			with (writingStyle)
			{
				color = 0x000000;
				bold = false;
				font = "Univers";
				size = 12;
			}
			
			writing.setTextFormat(writingStyle);
		}
	}
}
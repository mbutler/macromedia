package 
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.net.*;

	public class EmailClient extends MovieClip 
	{
		private var emailField:TextField = new TextField();
		private var emailStyle:TextFormat = new TextFormat();
		private var loader:URLLoader = new URLLoader();
		private var copy:String;
		private var exit:RedButton = new RedButton();

		public function EmailClient() 
		{
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, place);

			x = 500; y = 350;
			addChild(emailField);
			addChild(exit);
			exit.x = 278; exit.y = -195;
			loader.load(new URLRequest("email.txt"));
			loader.addEventListener(Event.COMPLETE, onLoaded);			  
		}
		
		private function onLoaded(e:Event):void
		{
			copy = e.target.data;
			copy = copy.split("\r\n").join("\n");
			emailField.text = copy;
			
			setTextStyle();
			
		}
		
		private function pickup(e:MouseEvent):void 
		{
			if (e.target.name == "email field") 
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
		
		private function setTextStyle() 
		{
			with (emailField) 
			{
				name = "email field";
				width = 575;
				height = 300;
				x = -288;
				y = -115;
				background = true;
				wordWrap = true;
				multiline = false;
				TextFieldAutoSize.LEFT
								
			}

			with (emailStyle) 
			{
				color = 0x000000;
				bold = false;
				font = "Univers";
				size = 12;
			}
				
			emailField.setTextFormat(emailStyle);
			
		}
	}
}
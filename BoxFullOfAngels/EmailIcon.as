package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class EmailIcon extends Sprite
	{
		private var emailIconTextStyle:TextFormat = new TextFormat();
		private var emailIconTextField:TextField = new TextField();
		
		
		public function EmailIcon(emailIconName, myX, myY)
		{
			emailIconTextField.text = emailIconName;
			setEmailIconTextStyle();
			x = myX; y = myY;
			
			addChild(emailIconTextField);
			doubleClickEnabled = true;
			addEventListener(MouseEvent.DOUBLE_CLICK, doubleClick);
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function doubleClick(e:MouseEvent)
		{
			var email:EmailClient = new EmailClient();
			parent.addChild(email);
		}
		
		private function pickup(e:MouseEvent) : void
		{
			e.currentTarget.startDrag();
			e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
		}
		
		private function drop(e:MouseEvent) : void
		{
			e.currentTarget.stopDrag();
		}
		
		private function setEmailIconTextStyle() : void
		{
			with (emailIconTextField)
			{
				x = 13;
				y = 70;
				width = 40;
				height = 20;
			}
			
			with (emailIconTextStyle)
			{
				color = 0x000000;
				font = "Univers";
				size = 12;
				align = "center";
			}			
			
			emailIconTextField.setTextFormat(emailIconTextStyle);
		}
	}
	
}
package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class Attachment extends MovieClip
	{
		private var attachTextField:TextField = new TextField();
		private var attachTextStyle:TextFormat = new TextFormat();
		private var thisName:String;
		
		
		public function Attachment(description:String, myX : uint, myY : uint)
		{
			thisName = description;
			attachTextField.text = description;
			x = myX; y = myY;
			addChild(attachTextField);
			setAttachTextStyle();
			doubleClickEnabled = true;
			addEventListener(MouseEvent.DOUBLE_CLICK, doubleClick);
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function doubleClick(e:MouseEvent) : void
		{
			switch (thisName)
			{
				case "Notebook 1":
				var write1:Note = new Note("Notebook 1");
				write1.name = "Notebook 1";
				parent.parent.addChild(write1);
				break;
				
				case "Notebook 2":
				var write2:Note = new Note("Notebook 2");
				write2.name = "Notebook 2";
				parent.parent.addChild(write2);
				break;
				
				case "Notebook 3":
				var write3:Note = new Note("Notebook 3");
				write3.name = "Notebook 3";
				parent.parent.addChild(write3);
				break;
			}
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
		
		private function setAttachTextStyle() : void
		{
			with (attachTextField)
			{
				x = -5;
				y = 70;
				width = 80;
				height = 20;
				TextFieldAutoSize.LEFT
				selectable = false;
			}
			
			with (attachTextStyle)
			{
				color = 0x000000;
				font = "Univers";
				size = 12;
				align = "center";
			}			
			
			attachTextField.setTextFormat(attachTextStyle);
		}
	}
}
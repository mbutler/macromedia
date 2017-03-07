package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class Box extends MovieClip
	{
		private var boxTextStyle:TextFormat = new TextFormat();
		private var boxTextField:TextField = new TextField();
		private var myName:String;
		
		public function Box(boxName : String, myX : uint, myY : uint)
		{
			myName = boxName;
			boxTextField.text = boxName;
			setBoxTextStyle();
			x = myX; y = myY;
			
			addChild(boxTextField);
			doubleClickEnabled = true;
			addEventListener(MouseEvent.DOUBLE_CLICK, doubleClick);
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, drop);
			
		}
		
		private function doubleClick(e:MouseEvent) : void
		{
			switch (myName)
			{
				case "Box 1":
				var keyEntry1:KeyEntry = new KeyEntry("box 1");
				parent.parent.addChild(keyEntry1);
				break;
				
				case "Box 2":
				var keyEntry2:KeyEntry = new KeyEntry("box 2");
				parent.addChild(keyEntry2);
				break;
				
				case "Box 3":
				var keyEntry3:KeyEntry = new KeyEntry("box 3");
				parent.addChild(keyEntry3);
				break;
				
				case "Box 4":
				var keyEntry4:KeyEntry = new KeyEntry("box 4");
				parent.addChild(keyEntry4);
				break;
				
				case "Box 5":
				var keyEntry5:KeyEntry = new KeyEntry("box 5");
				parent.addChild(keyEntry5);
				break;
				
			}
		}
		
		private function pickup(e:MouseEvent) : void
		{
			e.currentTarget.startDrag();
			//trace(getChildIndex(e.target.name));
			e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
		}
		
		private function drop(e:MouseEvent) : void
		{
			e.currentTarget.stopDrag();
		}
		
		private function setBoxTextStyle() : void
		{
			with (boxTextField)
			{
				x = 26;
				y = 70;
				width = 40;
				height = 20;
				selectable = false;
			}
			
			with (boxTextStyle)
			{
				color = 0x000000;
				font = "Univers";
				size = 12;
				align = "center";
			}			
			
			boxTextField.setTextFormat(boxTextStyle);
		}
	}
}
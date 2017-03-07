package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class KeyEntry extends Sprite
	{
		private var keyTextField:TextField = new TextField();
		private var keyTextStyle:TextFormat = new TextFormat();
		private var exit:RedButton = new RedButton();
		var myName:String;
		private var keyPhrase:String = "Ya'aqov ben Yehuda";
		
				
		public function KeyEntry(boxName:String)
		{
			myName = boxName;
			x = 400; y = 300;
			setKeyTextFieldStyle();
			exitFormat();
			addChild(keyTextField);
			addChild(exit);
			
			addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
		}
		
		private function keyboardHandler(e:KeyboardEvent):void
		{
			if (e.charCode == 13)
			{
				if (keyTextField.text != keyPhrase)
				{
					//trace("denied");
					keyTextField.text = "";
				} else
				{
					switch (myName)
					{
						case "box 1":
						var openbox1:OpenBox1 = new OpenBox1();
						parent.addChild(openbox1);
						parent.removeChild(this);
						break;
						
						case "box 2":
						var openbox2:OpenBox2 = new OpenBox2();
						parent.addChild(openbox2);
						parent.removeChild(this);
						break;
						
						case "box 3":
						var openbox3:OpenBox3 = new OpenBox3();
						parent.addChild(openbox3);
						parent.removeChild(this);
						break;
												
						case "box 4":
						var openbox4:OpenBox4 = new OpenBox4();
						parent.addChild(openbox4);
						parent.removeChild(this);
						break;
						
						case "box 5":
						var openbox5:OpenBox5 = new OpenBox5();
						parent.addChild(openbox5);
						parent.removeChild(this);
						break;
						
					}
				}
			}
		}
		
		private function setKeyTextFieldStyle()
		{
			with (keyTextField)
			{
				x = 52; y = 6;
				width = 186;
				height = 21;
				background = true;
				maxChars = 18; // number in "ya'aqov ben yehuda"
				displayAsPassword = true;
				type = TextFieldType.INPUT;
				text = "";
			}
			
			with (keyTextStyle)
			{
				color = 0x000000;
				font = "Univers";
				size = 14;
				align = "left";
			}
			
			keyTextField.setTextFormat(keyTextStyle);
		}
		
		private function exitFormat()
		{
			exit.x = 250;
			exit.y = 8;
		}
	}
}
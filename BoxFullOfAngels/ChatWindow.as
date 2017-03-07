package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.net.*;
	
	
	
	public class ChatWindow extends Sprite
	{
		private var inputField:TextField = new TextField();
		private var chatName:TextField = new TextField();
		private var displayField:TextField = new TextField();
		private var textLook:TextFormat = new TextFormat();
		private var inputLook:TextFormat = new TextFormat();
		private var exit:RedButton = new RedButton();
		private var personName:String;
		private var maxVisibleLines:uint = 15;
		private var readingTime:uint;
		private var writingTime:uint;
		private var isRunning:Boolean = false;
		//var univers_11:Font = new Uni11();
		//var univers_12:Font = new Uni11();
		private var respond:String;
		private var fakeInput:String;
		private var output_txt:String;
		private var input_txt:String;
		private var my_xml:XML;
		private var myTextBox:TextField=new TextField  ;
		private var myOutputBox:TextField=new TextField  ;
		private var myRecordBox:TextField=new TextField ;
		var persona:String;
		var XML_URL:String 
		
		
				
		public function ChatWindow(myName:String, myX : uint, myY : uint)
		{
			if (myName == "Walter Benjamin")
			{
				persona = "b.xml";
				trace("dfdf");
			} else
			{
				persona = "m.xml";
			}
			
			XML_URL = persona;
			
			x = myX; y = myY;
			inputFieldStyle();
			chatNameStyle(myName);
			exitFormat();
			personName = myName;
			
			//displayField.text needs to be initialized ONCE - don't put into helper function
			displayField.text = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"+myName+": Hello";
			displayFieldStyle();
			
			addChild(inputField);
			addChild(chatName);
			addChild(displayField);
			addChild(exit);
			
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, place);
			addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
					
		}
		
		private function pickup(e:MouseEvent):void
		{
			if (e.target.name == "display field")
			{
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
			} else 
			{
				e.currentTarget.startDrag();
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
			}
					
		}
		
		private function place(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
		
		private function keyHandler(e:KeyboardEvent):void
		{
			if (e.charCode == 13)
			{
				if (isRunning == true)
				{
					return
				} else 
				{
					displayField.appendText("\n\nme: "+inputField.text);
					
					fakeInput = inputField.text;
					init();
					
					if (output_txt == null)
					{
						output_txt = "I don't understand.";
					}
										
				}
				
				
				//pauseTimer gives the illusion that your message is sent and they are reading it
				if (inputField.length < 84)
				{
					readingTime = 2000;
				} else
				{
					//characters divided by average length of word (6) divided by wpm reading speed (4) - adjust accordingly
					readingTime = ((inputField.length / 6) / 4) * 1000;
				}
				
				displayField.scrollV = displayField.numLines + maxVisibleLines;
				inputField.text = "";				
				
				var pauseTimer:Timer = new Timer(readingTime,1);
				pauseTimer.addEventListener(TimerEvent.TIMER, onPauseTimer);
				pauseTimer.start();
				isRunning = true;
				
			}
		}
		
		private function onPauseTimer(e:TimerEvent):void
		{
			isRunning = false;
			//typingTimer is to give the illusion of them actually taking the time to write
					
			if (output_txt.length < 10)
			{
				writingTime = 1000;
			} else
			{
				//8 words per second typing speed
				writingTime = (output_txt.length / 8) * 1000;
			}
			
			displayField.appendText("\n"+personName+" is typing...");
			displayField.scrollV = displayField.numLines + maxVisibleLines;
						
			var typingTimer:Timer = new Timer(writingTime,1);
			typingTimer.addEventListener(TimerEvent.TIMER, onTypingTimer);
			typingTimer.start();
			
			isRunning = true;
			
					
		}
		
		private function onTypingTimer(e:TimerEvent):void
		{
			
			isRunning = false;
			//delayTimer is to give the illusion of a little network lag. currently set to zero cuz that's how gtalk looks
			var typingNotice = personName.length + 13;
			var go_back = displayField.length - typingNotice;
			
			if (displayField.numLines > maxVisibleLines)
			{
				displayField.replaceText(go_back,displayField.length, " ");
			} else {
				displayField.replaceText(go_back,displayField.length, "");
			}
			
			displayField.scrollV = displayField.numLines + maxVisibleLines;
			
			var delayTimer:Timer = new Timer(0,1);
			delayTimer.addEventListener(TimerEvent.TIMER, onDelayTimer);
			delayTimer.start();
			isRunning = true;
		}
		
		private function onDelayTimer(e:TimerEvent):void
		{
			
			isRunning = false;
			displayField.appendText("\n"+personName+": "+output_txt);
			displayField.scrollV = displayField.numLines + maxVisibleLines;
			
		}
		
		private function inputFieldStyle()
		{
			with (inputField)
			{
				name = "input field";
				width = 217;
				height = 22;
				x = -108;
				y = 116;
				background = false;
				type = TextFieldType.INPUT;
				text = " ";
				//embedFonts = true;
				//antiAliasType = AntiAliasType.ADVANCED;
			}			
			
			with (inputLook)
			{
				color = 0x000000;
				bold = false;
				font = "Univers";
				size = 12;
			}	
			
			inputField.setTextFormat(inputLook);
	
		}
		
		private function chatNameStyle(myName:String)
		{
			with (chatName)
			{
				name = "chat name";
				width = 217;
				height = 22;
				x = -114;
				y = -147;
				background = false;
				type = TextFieldType.DYNAMIC;
				text = myName;
				selectable = false;
			}
			
			with (textLook)
			{
				color = 0xFFFFFF;
				bold = false;
				font = "Univers";
				size = 12;
			}		
						
			chatName.setTextFormat(textLook);
			
			
		}
		
		private function displayFieldStyle()
		{
			with (displayField)
			{
				name = "display field";
				width = 230;
				height = 217;
				x = -115;
				y = -115;
				background = false;
				wordWrap = true;
				multiline = true;
			}
			
			with (textLook)
			{
				color = 0xFFFFFF;
				bold = false;
				font = "Univers";
				size = 11;
			}
			
			displayField.setTextFormat(textLook);
		}
		
		private function exitFormat()
		{
			exit.x = 100;
			exit.y = -144;
		}
		
		//opens and reads the xml file
		private function init():void
		{
			my_xml = new XML;
			my_xml.ignoreWhite = true;

			var my_xmlURL:URLRequest = new URLRequest(XML_URL);
			var myLoader:URLLoader = new URLLoader(my_xmlURL);
			myLoader.addEventListener("complete",xmlLoaded);

			function xmlLoaded(event:Event):void
			{
				my_xml = XML(myLoader.data);
				findAnswer(fakeInput);
			}
			
		}
		
		//cleans up the text and sends it to findMatch
		private function findAnswer(the_str:String)
		{
			var str_array:Array = this.shaveChars(the_str);
			var index_str:int = 0;
			findMatch(str_array, index_str, my_xml.children());
		}
		
		private function findMatch(str_array:Array, index_str:int, xml:XMLList):void
		{
			var index_str2:int = index_str;
			var index_xml:int = 0;
			
			//loops through the input string array and compares each to xml list
			outerLoop:for (var i:int = index_str2; i < str_array.length; i++)
			{
				for (var j:int = 0; j < xml.length(); j++)
				{
					if (str_array[i] == xml[j].name())
					{
						break outerLoop;
					}
				}
			}

			index_str2 = i;
			index_xml = j;

			//looks at each node of the xml
			if (index_str2 == str_array.length || index_xml == xml.length())
			{
				//this line makes it so you can have text just for one word
				if(xml[index_xml-1].parent().text() != undefined)
				{
					output_txt = xml[index_xml-1].parent().text();
				}
				else
				{
					//mixes up the error messages to fool Turing tests
					var choice:Number = Math.random();
					if (choice < 0.5) {
					output_txt = "Please fine-tune your Jürgenson wave.  I don't understand.";
				} else if (choice < 0.8)
				{
					sortStringArray(str_array);
					output_txt = str_array[0] + "?";
				} else {
					sortStringArray(str_array);
					output_txt = "Pardon.  Did you say " + str_array[0] + " ?";
				}
				}
				
			} else if (xml[index_xml].children().children() != undefined) {
				findMatch(str_array,index_str2,xml[index_xml].children());
			} else if (xml[index_xml].children().children() == undefined && xml[index_xml].text() != undefined) {
				output_txt = xml[index_xml].text();
			} else
			{
				output_txt="I don't know " + xml[index_xml].name() + " that is.";
			}

		}

		// removes unwanted characters
		private function shaveChars(the_str:String):Array
		{
			var the_strlow:String = the_str.toLowerCase();
			var str_array:Array = the_strlow.split(/\?|\.|\!|\,|\'|\"|\s+/g);
			return str_array;
		}
		
		//sort array of input strings on length
		private function sortStringArray(a:Array):void
		{
			var l:int = a.length;
			for (var i:int = 0; i < l - 1; i++)
			{
				for (var j:int = i + 1; j < l; j++)
				{
					if (a[i].length < a[j].length)
					{
						var temp = a[j];
						a[j] = a[i];
						a[i] = temp;
					}
				}
			}
		}
	}
}
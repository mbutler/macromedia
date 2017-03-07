package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.media.*;
	import flash.net.*;
	
	public class Radio extends Sprite
	{
		var mySwitch:Boolean = false;
		var freqStyle:TextFormat = new TextFormat();
		var titleStyle:TextFormat = new TextFormat();
		var freqField:TextField = new TextField();
		var currentFreq:uint = 810;
		var currentTitle:TextField = new TextField();
		var upButton:RadioButton = new RadioButton();
		var downButton:RadioButton = new RadioButton();
		var off:Off = new Off();
		var offToggle:Boolean = true;
		var notGreen:NotGreen = new NotGreen();
		
		var loadStory:URLRequest = new URLRequest("story.mp3");
		var openStory:Sound = new Sound();
		var storyChannel:SoundChannel;
		
		var loadMcluhan:URLRequest = new URLRequest("mcluhan.mp3");
		var openMcluhan:Sound = new Sound();
		var mcluhanChannel:SoundChannel;
		
		var loada:URLRequest = new URLRequest("a.mp3");
		var opena:Sound = new Sound();
		var aChannel:SoundChannel;
		
		var loadb:URLRequest = new URLRequest("b.mp3");
		var openb:Sound = new Sound();
		var bChannel:SoundChannel;
		
		var loadc:URLRequest = new URLRequest("c.mp3");
		var openc:Sound = new Sound();
		var cChannel:SoundChannel;
		
		var loadd:URLRequest = new URLRequest("d.mp3");
		var opend:Sound = new Sound();
		var dChannel:SoundChannel;
		
		var loade:URLRequest = new URLRequest("e.mp3");
		var opene:Sound = new Sound();
		var eChannel:SoundChannel;
		
		var loadf:URLRequest = new URLRequest("f.mp3");
		var openf:Sound = new Sound();
		var fChannel:SoundChannel;
		
		var loadg:URLRequest = new URLRequest("g.mp3");
		var openg:Sound = new Sound();
		var gChannel:SoundChannel;
		
		var loadh:URLRequest = new URLRequest("h.mp3");
		var openh:Sound = new Sound();
		var hChannel:SoundChannel;
		
		var loadi:URLRequest = new URLRequest("i.mp3");
		var openi:Sound = new Sound();
		var iChannel:SoundChannel;
		
		var loadj:URLRequest = new URLRequest("j.mp3");
		var openj:Sound = new Sound();
		var jChannel:SoundChannel;
		
		var loadwave:URLRequest = new URLRequest("wave.mp3");
		var openwave:Sound = new Sound();
		var waveChannel:SoundChannel;
	
		public function Radio()
		{
			x = 25; y = 600;
			
			freqField.text = currentFreq + " kHz";
			currentTitle.text = "A Box Full of Angels";
			off.x = 190; off.y = -1;
			addChild(off);
			
			setFreqStyle();			
			setTitleStyle()
			upButtonFormat();
			downButtonFormat();
			
			addEventListener(MouseEvent.MOUSE_DOWN, pickup);
			addEventListener(MouseEvent.MOUSE_UP, place);
			off.addEventListener(MouseEvent.MOUSE_DOWN, handleOff);
			
			addChild(freqField);
			addChild(currentTitle);
			
			addChild(upButton);
			addChild(downButton);
			
			notGreen.x = 36; notGreen.y = 45;
			addChild(notGreen);
			
			openStory.load(loadStory);
			storyChannel:SoundChannel;			
			storyChannel = openStory.play(0, int.MAX_VALUE);
			setVolume(0, storyChannel);
			
			openMcluhan.load(loadMcluhan);
			mcluhanChannel:SoundChannel;
			mcluhanChannel = openMcluhan.play(0, int.MAX_VALUE);
			setVolume(0, mcluhanChannel);
			
			opena.load(loada);
			aChannel:SoundChannel;			
			aChannel = opena.play(0, int.MAX_VALUE);
			setVolume(0, aChannel);
			
			openb.load(loadb);
			bChannel:SoundChannel;			
			bChannel = openb.play(0, int.MAX_VALUE);
			setVolume(0, bChannel);
			
			openc.load(loadc);
			cChannel:SoundChannel;			
			cChannel = openc.play(0, int.MAX_VALUE);
			setVolume(0, cChannel);
			
			opend.load(loadd);
			dChannel:SoundChannel;			
			dChannel = opend.play(0, int.MAX_VALUE);
			setVolume(0, dChannel);
			
			opene.load(loade);
			eChannel:SoundChannel;			
			eChannel = opene.play(0, int.MAX_VALUE);
			setVolume(0, eChannel);
			
			openf.load(loadf);
			fChannel:SoundChannel;			
			fChannel = openf.play(0, int.MAX_VALUE);
			setVolume(0, fChannel);
			
			openg.load(loadg);
			gChannel:SoundChannel;			
			gChannel = openg.play(0, int.MAX_VALUE);
			setVolume(0, gChannel);
			
			openh.load(loadh);
			hChannel:SoundChannel;			
			hChannel = openh.play(0, int.MAX_VALUE);
			setVolume(0, hChannel);
			
			openi.load(loadi);
			iChannel:SoundChannel;			
			iChannel = openi.play(0, int.MAX_VALUE);
			setVolume(0, iChannel);
			
			openj.load(loadj);
			jChannel:SoundChannel;			
			jChannel = openj.play(0, int.MAX_VALUE);
			setVolume(0, jChannel);
			
			openwave.load(loadwave);
			waveChannel:SoundChannel;			
			waveChannel = openwave.play(0, int.MAX_VALUE);
			setVolume(0, waveChannel);
								
		}
		
		private function setVolume(vol:Number, channel):void
		{
			var transformVol:SoundTransform = channel.soundTransform;
			transformVol.volume = vol;
			channel.soundTransform = transformVol;
		}
	
		private function handleOff(e:MouseEvent):void
		{
			
			if (offToggle == true)
			{
				//on
				removeChild(notGreen);
				offToggle = false;
				addEventListener(Event.ENTER_FRAME, handleUp);
				addEventListener(Event.ENTER_FRAME, handleDown);
			} else
			{
				//off
				removeEventListener(Event.ENTER_FRAME, handleUp);
				removeEventListener(Event.ENTER_FRAME, handleDown);
				notGreen.x = 36; notGreen.y = 45;
				addChild(notGreen);
				
				setVolume(0, mcluhanChannel);
				setVolume(0, storyChannel);
				setVolume(0, aChannel);
				setVolume(0, bChannel);
				setVolume(0, cChannel);
				setVolume(0, dChannel);
				setVolume(0, eChannel);
				setVolume(0, fChannel);
				setVolume(0, gChannel);
				setVolume(0, hChannel);
				setVolume(0, iChannel);
				setVolume(0, jChannel);
				setVolume(0, waveChannel);
				
				
				offToggle = true;
			}
		}
		
		private function pickup(e:MouseEvent):void
		{
			if (e.target == upButton)
			{
				if (offToggle == false)
				{
					removeEventListener(Event.ENTER_FRAME, handleDown);
					addEventListener(Event.ENTER_FRAME, handleUp);
				}
			} else if (e.target == downButton)
			{
				if (offToggle == false)
				{
					removeEventListener(Event.ENTER_FRAME, handleUp);
					addEventListener(Event.ENTER_FRAME, handleDown);
				}
			} 
			
			{
				e.currentTarget.startDrag();
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren - 1);
			}
					
		}
		
		private function place(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
		
		private function handleUp(e:Event):void
		{
			setVolume(0, mcluhanChannel);
			setVolume(0, storyChannel);
			setVolume(0, aChannel);
			setVolume(0, bChannel);
			setVolume(0, cChannel);
			setVolume(0, dChannel);
			setVolume(0, eChannel);
			setVolume(0, fChannel);
			setVolume(0, gChannel);
			setVolume(0, hChannel);
			setVolume(0, iChannel);
			setVolume(0, jChannel);
			setVolume(0, waveChannel);
			
			currentFreq++;
			checkFreq(currentFreq);
			freqField.text = currentFreq + " kHz";
			setFreqStyle();
		}
		
		private function handleDown(e:Event)
		{
			setVolume(0, mcluhanChannel);
			setVolume(0, storyChannel);
			setVolume(0, aChannel);
			setVolume(0, bChannel);
			setVolume(0, cChannel);
			setVolume(0, dChannel);
			setVolume(0, eChannel);
			setVolume(0, fChannel);
			setVolume(0, gChannel);
			setVolume(0, hChannel);
			setVolume(0, iChannel);
			setVolume(0, jChannel);
			setVolume(0, waveChannel);
			
			currentFreq--;
			checkFreq(currentFreq);
			freqField.text = currentFreq + " kHz";
			setFreqStyle();
		}
	
		private function checkFreq(freq : uint)
		{
			if (offToggle == false)
			{
				if (freq < 520)
				{
					currentFreq = 1610
				} else if (freq > 1610)
				{
					currentFreq = 520
				} else if (freq == 620)
				{
					freq = 620;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, mcluhanChannel);
				} else if (freq == 810)
				{
					freq = 810;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, storyChannel);
				} else if (freq == 700)
				{
					freq = 700;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, aChannel);
				} else if (freq == 720)
				{
					freq = 720;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, bChannel);
				} else if (freq == 900)
				{
					freq = 900;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, cChannel);
				} else if (freq == 980)
				{
					freq = 980;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, dChannel);
				} else if (freq == 1040)
				{
					freq = 1040;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, eChannel);
				} else if (freq == 1060)
				{
					freq = 1060;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, fChannel);
				} else if (freq == 1100)
				{
					freq = 1100;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, gChannel);
				} else if (freq == 1175)
				{
					freq = 1175;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, hChannel);
				} else if (freq == 1220)
				{
					freq = 1220;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, iChannel);
				} else if (freq == 1390)
				{
					freq = 1390;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, jChannel);
				} else if (freq == 1450)
				{
					freq = 1450;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, waveChannel);
					var chatM:ChatWindow = new ChatWindow("Marshall McLuhan", 180, 180);
					parent.addChild(chatM);
				} else if (freq == 1550)
				{
					freq = 1550;
					removeEventListener(Event.ENTER_FRAME, handleUp);
					removeEventListener(Event.ENTER_FRAME, handleDown);
					setVolume(1, waveChannel);
					
					if (mySwitch == false)
					{
						mySwitch = true;
						var chatB:ChatWindow = new ChatWindow("Walter Benjamin", 180, 180);
						parent.addChild(chatB);
					}
					
				}
			}
			
		}
		
		private function setFreqStyle()
		{
			freqField.name = "frequency";
			freqField.width = 90;
			freqField.height = 40;
			freqField.x = 67;
			freqField.y = 42;
			
			freqStyle.color = 0x233914;
			freqStyle.bold = true;
			freqStyle.font = "Univers";
			freqStyle.size = 18;
			
			freqField.setTextFormat(freqStyle);
		}
		
		private function setTitleStyle()
		{
			with (currentTitle)
			{
				name = "title";
				width = 180;
				height = 40;
				x = 40;
				y = 68;
			}
			
			with (titleStyle)
			{
				color = 0x233914;
				font = "Univers";
				size = 14;
			}
					
			currentTitle.setTextFormat(titleStyle);
		}
		
		private function upButtonFormat()
		{
			upButton.x = 190;
			upButton.y = 43;
		}
		
		private function downButtonFormat()
		{
			downButton.x = 190;
			downButton.y = 78;
		}
		
		
	}
}
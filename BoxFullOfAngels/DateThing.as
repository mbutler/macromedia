package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class DateThing extends Sprite
	{
		var current:Date = new Date();
		var field:TextField = new TextField();
		var dayLabels:Array = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
		var monthLabels:Array = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
		var day:String = dayLabels[current.getDay()];
		var month:String = monthLabels[current.getMonth()];
		var year:Number = (current.getFullYear() + 17);
		var dayOfMonth:Number = current.getDate();
		var style:TextFormat = new TextFormat();
		
		public function DateThing()
		{
			x = 480; y = 20;
			field.text = month + " " + dayOfMonth + ", " + year;
			addChild(field);
			setLook();
		}
		
		private function setLook()
		{
			with (field)
			{
				name = "the date";
				width = 230;
				height = 50;
				x = 350;
				y = 5;
				background = false;
				wordWrap = true;
				multiline = true;
			}
			
			with (style)
			{
				color = 0xCCCCCC;
				bold = true;
				font = "Univers";
				size = 16;
			}
			
			field.setTextFormat(style);
		}
	}
}
package {
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;

	public class IntermediaChart extends Sprite {
		public var circle_container:Sprite;
		public var circle:Circle;
		public var newbutton:Createnew_btn;
		public var i:int;
		public var circleList:Array;
		public var circleLabel:TextField;
		public var circleNameFormat:TextFormat;
		public var isSelected:Boolean;
		public var selectedCircles:Array;
		public var container:String;
		

		public function IntermediaChart() 
		{

			circleList = new Array();
			selectedCircles = new Array();
			newbutton = new Createnew_btn();
			addChild(newbutton);
			newbutton.x = 655.4;
			newbutton.y = 526;
			newbutton.addEventListener(MouseEvent.CLICK, drawCircle);
			
			
			
			addEventListener(KeyboardEvent.KEY_DOWN,resizeCircle);
			
			
			//addEventListener(Event.ENTER_FRAME
		}
		
		
		
		function drawCircle(event:MouseEvent) {
			
			i++;
			circle = new Circle();
			circle_container = new Sprite();
			
			circle.name = "circle" + i;
			
			circleLabel = new TextField;
			circleLabel.type = TextFieldType.INPUT;		
			circleNameFormat = new TextFormat();
			circleLabel.setTextFormat(circleNameFormat);			
			circleLabel.text = "?";
			circleNameFormat.font = "verdana";
			circleNameFormat.align = "center";
			//circleNameFormat.wordWrap = true;
			circleLabel.setTextFormat(circleNameFormat);
			
			circle_container.addChild(circle);
			circle_container.addChild(circleLabel);
			addChild(circle_container);
			container = circle_container.name;
			trace(container);
			
			circleList.push(circle.name);
			
			//trace(circleList[0]);
			
			circle.x = 649;
			circle.y = 475;
			circleLabel.x = circle.x-49;
			circleLabel.y = circle.y-8;
			
			circle_container.addEventListener(MouseEvent.MOUSE_DOWN,pickUp);
			circle_container.addEventListener(MouseEvent.MOUSE_UP,dropIt);
			
			circle_container.addEventListener(MouseEvent.MOUSE_DOWN,changeSelection);

			

			
			

		}
		function pickUp(e:MouseEvent)
		{
			//never forget currentTarget.  I think it's how you only talk to the parent and not child.
			if(e.eventPhase == EventPhase.AT_TARGET){
        
        e.target.startDrag();
			
		}

		function dropIt(e:MouseEvent)
		{
			if(e.eventPhase == EventPhase.AT_TARGET){
        
        e.target.stopDrag();
    }
		}
		
		function changeSelection(event:MouseEvent)
		{
			selectedCircles.splice(0);
			selectedCircles.push(event.currentTarget);
			
			trace(selectedCircles);
						
		}
		
		
		function resizeCircle(event:KeyboardEvent)
		{
			
			if (event.keyCode == 38)
			{
				circle.scaleX += 0.1; 
				circle.scaleY += 0.1;
			} else if (event.keyCode == 40)
			{
				circle.scaleX -= 0.1;
				circle.scaleY -= 0.1;
			} else
			{
				return;
			}
		}
				
		}
			
	}
}
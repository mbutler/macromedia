package {

	import flash.display.*;
	import flash.events.*;
	import fl.controls.*;

	public class chart extends MovieClip {


		var createnew_btn:Createnew_btn = new Createnew_btn();
		var slider:Slider = new Slider();
		var circleList:Array = new Array();

		var i:int;
		i=0;


		addChild(slider);
		addChild(createnew_btn);

		createnew_btn.x = 655.4;
		createnew_btn.y = 526;

		slider.width = 150;
		slider.x = 616;
		slider.y = 544;

		createnew_btn.addEventListener(MouseEvent.CLICK,drawCircle);


		function drawCircle(e:MouseEvent) {

			i++;
			var circle:Circle_mc = new Circle_mc();
			circle.name = "circle" + i;
			addChild(circle);
			circleList.push(circle.name);
			circle.x = 747;
			circle.y = 514;

			var circleName:TextField = new TextField;
			circleName.text = "dlfdlkf";
			circleName.x = circle.x;
			circleName.y = circle.y;

			addChild(circleName);

			circle.addEventListener(MouseEvent.MOUSE_DOWN,pickUp);
			circle.addEventListener(MouseEvent.MOUSE_UP,dropIt);

		}

		function pickUp(event:MouseEvent) {

			event.target.startDrag();
		}

		function dropIt(event:MouseEvent) {

			event.target.stopDrag();

		}
	}
}
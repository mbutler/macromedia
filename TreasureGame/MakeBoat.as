package
{
	import flash.display.*;
	import flash.events.*;
	
	public class MakeBoat extends Sprite
	{
		var boat:Shape = new Shape();
		var panel:Panel = new Panel();
		var loc:Locations = new Locations();
		var mySwitch:Boolean = false;
		var boatSprite:Sprite = new Sprite();
		var myBoat:String;
		var foo:Array = new Array();
						
		public function MakeBoat(color:uint, type:String)
		{
			myBoat = type;
			boat.graphics.lineStyle(0.5, color, 0.25, false, LineScaleMode.NONE, CapsStyle.SQUARE);
			boat.graphics.beginFill(color);
			boat.graphics.moveTo(8.4,0);
			boat.graphics.lineTo(16.4,0);
			boat.graphics.lineTo(18.3,4);
			boat.graphics.lineTo(25.1,4);
			boat.graphics.lineTo(21.8,8.7);
			boat.graphics.lineTo(3,8.7);
			boat.graphics.lineTo(0,4);
			boat.graphics.lineTo(12.4,4);
			boat.graphics.lineTo(12.4,1.7);
			boat.graphics.lineTo(8.4,1.7);
			boat.graphics.lineTo(8.4,0);
			boat.graphics.endFill();
			boatSprite.addEventListener(MouseEvent.MOUSE_DOWN, clickBoat);
			boatSprite.addChild(boat);		
			addChild(boatSprite);
			var panel:Panel = new Panel();
			
						
		}
		
		private function clickBoat(e:MouseEvent):void
		{
			if (myBoat == "player boat")
			{
				if (mySwitch == false)
				{
					
					panel.x = loc.getPanelX();
					panel.y = loc.getPanelY();
					stage.addChildAt(panel,stage.numChildren);
					mySwitch = true;
					
				} else if (mySwitch == true)
				{
					var foo3 = loc.setPanelX(panel.x);					
					var foo4 = loc.setPanelY(panel.y);
					stage.removeChildAt(stage.numChildren - 1);					
					mySwitch = false;
				}
				
				
			}			
			
			
		}		
		
	}
}
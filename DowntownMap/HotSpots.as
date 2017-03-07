package
{
	import flash.display.*;
	import flash.events.*;
	
	public class HotSpots extends Sprite
	{
		public function HotSpots(buildingName:String, myX:int, myY:int, myW:Number, myH:Number)
		{
			var button:SimpleButton = new SimpleButton();
			button.x = myX;
			button.y = myY;
			button.upState = createSpot(myW,myH,0xEE6B2AA);
			button.overState = createSpot(myW,myH,0xE69082);
			button.downState = createSpot(myW,myH,0xE69082);			
			button.hitTestState = button.upState;
			
			button.addEventListener(MouseEvent.ROLL_OVER, handleOver);
			button.addEventListener(MouseEvent.MOUSE_OUT, handleOut);
			
			addChild(button);
		}
		
		public function createSpot(myH:Number,myW:Number,color:uint):Shape
		{
			var marker:Shape = new Shape;
			marker.graphics.lineStyle();
			marker.graphics.beginFill(color);
			marker.graphics.drawRect(0,0,myH,myW);
			marker.graphics.endFill();
			return marker;
		}
		
		public function handleOver(event:MouseEvent):void
		{
			var infoContainer:Sprite = new Sprite();
			var whiteBack:Shape = new Shape();
			whiteBack.graphics.lineStyle(0,0,100);
			whiteBack.graphics.beginFill(0xFFFFFF, 0.95);
			whiteBack.graphics.drawRect(event.stageX, event.stageY, (stage.stageWidth/2)-20, (stage.stageHeight/2)-20);
			whiteBack.graphics.endFill();
			infoContainer.addChild(whiteBack);
			
			
			//the 20 is a little buffer to keep it from flashing
			if (event.stageX > stage.width/2 && event.stageY > stage.height/2)
			{
				whiteBack.x = event.localX - whiteBack.width;
				whiteBack.y = event.localY - whiteBack.height;
				
			} else if (event.stageX < stage.width/2 && event.stageY > stage.height/2)
			{
				whiteBack.x = event.localX;
				whiteBack.y = (event.localY - whiteBack.height) + 20;
				
			} else if (event.stageX < stage.width/2 && event.stageY < stage.height/2)
			{
				whiteBack.x = event.localX - 20;
				whiteBack.y = event.localY - 20 ;
				
			} else if (event.stageX > stage.width/2 && event.stageY < stage.height/2)
			{
				whiteBack.x = (event.localX - whiteBack.width) - 20;
				whiteBack.y = event.localY + 20;
			}
			
			addChild(infoContainer);
			
			//event.updateAfterEvent();
			
			
			
		}
		
		public function handleOut(event:MouseEvent):void
		{
			removeChildAt(1);
			
		}
	}
}
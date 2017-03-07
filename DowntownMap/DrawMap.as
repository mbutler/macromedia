package 
{
	import flash.display.*;
	import flash.text.*;
	
	public class DrawMap extends Sprite
	{
		var mapContainer:Sprite = new Sprite;
		var sampleBuilding:Shape = new Shape();
		var sheraton:Shape = new Shape();
		var pedmall:Shape = new Shape();
		var pedmall2:Shape = new Shape();
		var lineThickness:Number = 1;
		var lineColor:Number = 0;
		var lineAlpha:Number = 100;
		var fillColor:int = 0xCCCCCC;
		
		var pedmallText:TextField = new TextField();
		
		
		
		public function DrawMap()
		{
			//narrow buildings (x,y,88,38)
			//square buildings (x,y,88,88)
			//street thickness = 28
			//alley thickness = 12
			
			buildingDraw(0,0,50,213);
			buildingDraw(0,241,50,329);
			
			
			buildingDraw(78,18,88,88);
			buildingDraw(194,18,88,88);
			buildingDraw(310,18,88,38);
			buildingDraw(310,68,88,38);
			buildingDraw(427,18,88,38);
			buildingDraw(427,68,88,38);
			buildingDraw(543,18,88,38);
			buildingDraw(543,68,88,38);
			buildingDraw(659,18,88,38);
			buildingDraw(659,68,88,38);
			buildingDraw(78,134,204,204);
			buildingDraw(310,134,88,88);
			buildingDraw(426,134,204,88);
			buildingDraw(658,134,88,38);
			buildingDraw(658,184,88,38);
			buildingDraw(310,250,88,88);
			
			buildingDraw(427,250,88,38);
			buildingDraw(427,300,88,38);
			buildingDraw(543,250,88,38);
			buildingDraw(543,300,88,38);
			buildingDraw(659,250,88,38);
			buildingDraw(659,300,88,38);
			
			buildingDraw(78,366,88,88);
			buildingDraw(78,482,88,38);
			buildingDraw(78,532,88,38);
			buildingDraw(194,366,88,205);
			
			buildingDraw(310,366,88,38);
			buildingDraw(310,416,88,38);
			buildingDraw(427,366,88,38);
			buildingDraw(427,416,88,38);
			buildingDraw(543,366,88,38);
			buildingDraw(543,416,88,38);
			
			buildingDraw(659,366,88,88);
			
			buildingDraw(310,532,88,38);
			
			buildingDraw(543,482,88,38);
			buildingDraw(543,532,88,38);
			buildingDraw(659,482,88,88);
			
			sheratonDraw();		
			pedmallDraw();
			
			mapContainer.addChild(pedmallText);
			
			pedmallText.text = "PEDMALL";
			pedmallText.x = 381;
			pedmallText.y = 458;
			
			addChild(mapContainer);
		}
		
		public function buildingDraw(myX, myY, myW, myH):void
		{
			sampleBuilding.graphics.lineStyle(lineThickness, lineColor, lineAlpha);
			sampleBuilding.graphics.beginFill(fillColor);
			sampleBuilding.graphics.drawRect(myX, myY, myW, myH);
			sampleBuilding.graphics.endFill();
			
			mapContainer.addChild(sampleBuilding);
		}
		
		public function sheratonDraw():void
		{
			sheraton.graphics.lineStyle(lineThickness, lineColor, lineAlpha);
			sheraton.graphics.beginFill(fillColor);
			sheraton.graphics.moveTo(310,482);
			sheraton.graphics.lineTo(514,482);
			sheraton.graphics.lineTo(514,570);
			sheraton.graphics.lineTo(426,570);
			sheraton.graphics.lineTo(426,520);
			sheraton.graphics.lineTo(310,520);
			sheraton.graphics.lineTo(310,482);
			mapContainer.addChild(sheraton);
		}
		
		public function pedmallDraw():void
		{
			pedmall.graphics.lineStyle();
			pedmall.graphics.beginFill(0xbff3f8);
			pedmall.graphics.drawRect(399, 366, 28, 90);
			pedmall.graphics.endFill();
			pedmall2.graphics.beginFill(0xbff3f8);
			pedmall2.graphics.drawRect(310, 455, 205, 27);
			pedmall2.graphics.endFill();
			
			
			mapContainer.addChild(pedmall);
			mapContainer.addChild(pedmall2);
		}
	}
}
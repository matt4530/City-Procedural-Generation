package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Settler 
	{
		public var divisions:int = 10;
		public var divisionColor:uint = 0xFF00AA00;
		public var goodPointsColor:uint = 0xFF00DD00;
		public var betterPointsColor:uint = 0xFF00FF00;
		public var chosenColor:uint = 0xFF00FF00;
		public var betterPointsEdgeThreshold:int = 60;
		public function Settler() 
		{
			
		}
		
		public function start():Point
		{
			var w:BitmapData = Main.world;
			var o:BitmapData = Main.infoOverlay;
			
			
			var goodPoints:Array = [];
			
			for (var i:int = 0; i < w.width; i += divisions)
			{
				for (var j:int = 0; j < w.width; j += divisions)
				{
					if (w.getPixel(i, j) == Main.WATER_COLOR)
					{
						o.setPixel32(i, j, divisionColor);
						var neighborsColor:Array = [w.getPixel(i + 10, j + 10), w.getPixel(i + 10, j - 10), w.getPixel(i - 10, j + 10), w.getPixel(i - 10, j - 10)];
						if (neighborsColor[0] != Main.WATER_COLOR )
						{
							goodPoints.push(i + 10, j + 10);
						}
						if (neighborsColor[1] != Main.WATER_COLOR )
						{
							goodPoints.push(i + 10, j - 10);
						}
						if (neighborsColor[2] != Main.WATER_COLOR )
						{
							goodPoints.push(i - 10, j + 10);
						}
						if (neighborsColor[3] != Main.WATER_COLOR )
						{
							goodPoints.push(i - 10, j - 10);
						}
					}
				}
			}
			var betterPoints:Array = [];
			for (var s:int = 0; s < goodPoints.length; s+=2)
			{
				o.setPixel32(goodPoints[s], goodPoints[s + 1], goodPointsColor);
				if (goodPoints[s] > betterPointsEdgeThreshold && goodPoints[s] < w.width - betterPointsEdgeThreshold && goodPoints[s + 1] > betterPointsEdgeThreshold && goodPoints[s + 1] < w.height - betterPointsEdgeThreshold)
				{
					o.fillRect(new Rectangle(goodPoints[s] - 1, goodPoints[s + 1] - 1, 3, 3), betterPointsColor);
					betterPoints.push(new Point(goodPoints[s], goodPoints[s + 1]));
				}
			}
			
			//junk map check
			if (betterPoints.length == 0)
			{
				betterPoints[0] = new Point(w.width / 2, w.height / 2);
			}
			
			var theChosenOne:Point = betterPoints[int(Math.random() * betterPoints.length)];
			o.fillRect(new Rectangle(theChosenOne.x-3, theChosenOne.y - 3, 7, 7), chosenColor);
			o.fillRect(new Rectangle(theChosenOne.x-1, theChosenOne.y - 1, 3, 3), 0x00000000);
			
			
			return theChosenOne;
			
		}
		
	}

}
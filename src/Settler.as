package  
{
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Settler 
	{
		public var divisions:int = 10;
		public var divisionColor:uint = 0xFF00FF;
		public function Settler() 
		{
			
		}
		
		public function start():void 
		{
			var w:BitmapData = Main.world;
			
			
			var goodPoints:Array = [];
			
			for (var i:int = 0; i < w.width; i += divisions)
			{
				for (var j:int = 0; j < w.width; j += divisions)
				{
					if (w.getPixel(i, j) == Main.WATER_COLOR)
					{
						w.setPixel(i, j, 0xFF00FF);
						var neighborsColor:Array = [w.getPixel(i + 10, j + 10), w.getPixel(i + 10, j - 10), w.getPixel(i - 10, j + 10), w.getPixel(i - 10, j - 10)];
						if (neighborsColor[0] != Main.WATER_COLOR && neighborsColor[0]!= divisionColor )
						{
							goodPoints.push(i + 10, j + 10);
						}
						if (neighborsColor[1] != Main.WATER_COLOR && neighborsColor[1]!= divisionColor )
						{
							goodPoints.push(i + 10, j - 10);
						}
						if (neighborsColor[2] != Main.WATER_COLOR && neighborsColor[2]!= divisionColor )
						{
							goodPoints.push(i - 10, j + 10);
						}
						if (neighborsColor[3] != Main.WATER_COLOR && neighborsColor[3]!= divisionColor )
						{
							goodPoints.push(i - 10, j - 10);
						}
					}
				}
			}
			
			for (var s:int = 0; s < goodPoints.length; s+=2)
			{
				w.setPixel(goodPoints[s], goodPoints[s + 1], 0x00FF00);
			}
		}
		
	}

}
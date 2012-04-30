package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Explorer 
	{
		public static var betterPoints:Array;
		public var divisions:int = 10;
		public var mountainColor:int = 0xFFAA0000
		public var betterColor:int = 0xFFDD0000
		public var explorerTravelDistance:int = 200;
		public function Explorer() 
		{
			
		}
		
		public function start(startLoc:Point):void 
		{
			
			var w:BitmapData = Main.world;
			var o:BitmapData = Main.infoOverlay;
			
			var v:Vector.<uint> = w.getVector(new Rectangle(0, 0, w.width, w.height));
			var goodPoints:Array = [];
			for (var i:int = 0; i < w.width; i += divisions)
			{
				for (var j:int = 0; j < w.width; j += divisions)
				{
					var c:uint = w.getPixel(i, j);
					if (c < 0x666666 && c > Main.WATER_COLOR)
					{
						o.setPixel32(i, j, mountainColor);
						goodPoints.push(i, j);
					}
				}
			}
			
			betterPoints = [];
			for (var s:int = 0; s < goodPoints.length; s+=2)
			{
				if (getDistanceSquared(goodPoints[s], goodPoints[s + 1],startLoc.x,startLoc.y) < explorerTravelDistance*explorerTravelDistance)
				{
					o.fillRect(new Rectangle(goodPoints[s] - 2, goodPoints[s + 1] - 2, 4, 4), betterColor);
					betterPoints.push(new Point(goodPoints[s], goodPoints[s + 1]));
				}
			}
			
			
		}
		
		static public function getDistanceSquared(dx:Number, dy:Number, tx:Number, ty:Number):Number
		{
			return (dx - tx) * (dx - tx) + (dy - ty)*(dy - ty);
		}
		
	}

}
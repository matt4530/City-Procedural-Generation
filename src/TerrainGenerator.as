package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class TerrainGenerator 
	{
		
		public function TerrainGenerator() 
		{
			
		}
		
		public function start():void 
		{
			var w:BitmapData = Main.world;
			w.perlinNoise(500, 500,5, Math.random()*100, false, true, 1, true);
			
			//var w2:BitmapData = Main.world2
			//w2.perlinNoise(80, 80,2, Math.random(), false, true, 1, true);
			
			
			var v:Vector.<uint> = w.getVector(new Rectangle(0,0,w.width, w.height));
			trace(v.length, 0x222222);
			for (var i:int = 0; i < v.length; i++)
			{
				//trace(v[i]);
				if (v[i] > 0xFF999999)
				{
					v[i] = Main.WATER_COLOR;
				}
			}
			trace("wot");
			w.setVector(new Rectangle(0,0,w.width, w.height), v);
		}
		
	}

}
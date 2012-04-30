package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Main extends Sprite 
	{
		public var ter:TerrainGenerator = new TerrainGenerator();
		public static var world:BitmapData = new BitmapData(800, 600, false);
		public static var infoOverlay:BitmapData = new BitmapData(800, 600, true,0x00000000);
		//public static var world2:BitmapData = new BitmapData(400, 600, false);
		public static var worldHolder:Bitmap = new Bitmap(world);
		public static var overlayHolder:Bitmap = new Bitmap(infoOverlay);
		//public static var worldHolder2:Bitmap = new Bitmap(world2);
		
		public static var WATER_COLOR:uint = 40;
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(worldHolder);
			addChild(overlayHolder);
			//worldHolder2.x = 800;
			//addChild(worldHolder2);
			ter.start();
			
			var s:Settler = new Settler();
			var startLoc:Point = s.start();
			
			var e:Explorer = new Explorer();
			e.start(startLoc);
			
		}
		
	}
	
}
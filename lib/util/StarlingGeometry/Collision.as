package util.StarlingGeometry 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Collision 
	{
		
		public function Collision() 
		{
			
		}
		
		/**
		 * Returns whether an whether an object is directly above another, defined as having at least one pixel with an x-value within the
		 * left and right side of a rectangle and having a smaller or equal y-value.
		 * 
		 * @param	obj  Determine whether this object is above the rectangle defined by the coordinates passed.
		 * @param	x1	 The x-coordinate of the top left corner of the the rectangle.
		 * @param	x2   The x-coordinate of the bottom right corner of the rectangle.
		 * @param   y1   The y-coordinate of the top left corner of the rectangle.
		 * @param   y2   The y-coordinate of the bottom right corner of the rectangle.
		 */
		public static function isDirectlyAboveRect( obj:Sprite, x1:Number, x2:Number, y1:Number, y2:Number ):Boolean
		{
			return ( obj.x + obj.width >= x1 ) && ( obj.x <= x2 ) && ( obj.y + obj.height <= y1 );
		}
		
		/**
		 * Returns whether an whether an object is directly above another, defined as having at least one pixel with an x-value within the
		 * left and right side of a rectangle and having a greater or equal y-value.
		 * 
		 * @param	obj  Determine whether this object is below the rectangle defined by the coordinates passed.
		 * @param	x1	 The x-coordinate of the top left corner of the the rectangle.
		 * @param	x2   The x-coordinate of the bottom right corner of the rectangle.
		 * @param   y1   The y-coordinate of the top left corner of the rectangle.
		 * @param   y2   The y-coordinate of the bottom right corner of the rectangle.
		 */
		public static function isDirectlyBelowRect( obj:Sprite, x1:Number, x2:Number, y1:Number, y2:Number ):Boolean
		{
			return ( obj.x + obj.width >= x1 ) && ( obj.x <= x2 ) && ( obj.y >= y2 );
		}
		
		public static function rectanglesTouch( r1x1:Number, r1x2:Number, r1y1:Number, r1y2:Number,
												r2x1:Number, r2x2:Number, r2y1:Number, r2y2:Number ):Boolean
		{
			return ( r1x2 >= r2x1 ) && ( r1x1 <= r2x2 ) && ( r1y1 <= r2y2 ) && ( r1y2 >= r2y1 );
		}
		
		public static function spriteBottomTouchesHorzLine( obj:Sprite, y:Number, xStart:Number, xEnd:Number ):Boolean
		{
			return obj.y + obj.height >= y && obj.x + obj.width >= xStart && obj.x <= xEnd;
		}
		
		public static function rectangleHasPoint( rect:Rectangle, pt:Point ):Boolean
		{
			return( pt.x >= rect.left && pt.x <= rect.right && pt.y >= rect.top && pt.y <= rect.bottom );
		}
		
		public static function spritesTouch( spr1:Sprite, spr2:Sprite ):Boolean
		{
			return( spr1.x + spr1.width > spr2.x && spr1.x < spr2.x + spr2.width && 
					spr1.y + spr1.height > spr2.y && spr1.y < spr2.y +  spr2.height )
		}
		
	}

}
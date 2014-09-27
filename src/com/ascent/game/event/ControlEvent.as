package com.ascent.game.event 
{
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class ControlEvent extends AscentEvent 
	{
		public static const JUMP:String = "jump";
		public static const INTERACT:String = "interact";
		
		private var _x:Number;
		private var _y:Number;
		
		public function ControlEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
		public function set x( value:Number ):void
		{
			_x = value;
		}
		
		public function get x():Number
		{
			return _x;
		}
		
		public function set y( value:Number ):void
		{
			_y = value;
		}
		
		public function get y():Number
		{
			return _y;
		}
		
	}

}
package com.ascent.game.event 
{
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class InteractionEvent extends AscentEvent 
	{
		
		private var _tag:String;
		public static const BUTTON_PRESSED:String = "button pressed";
		
		public function InteractionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
		public function get tag():String
		{
			return _tag;
		}
		
		public function set tag( value:String ):void
		{
			_tag = value;
		}
		
	}

}
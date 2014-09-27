package com.ascent.game.event 
{
	import com.ascent.game.basicobject.PhysicalObject;
	import flash.errors.IllegalOperationError;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class AscentEvent extends Event 
	{
		
		public static const ENEMY_SPAWNED:String = "enemy spawned";
		protected var _sender:PhysicalObject;
		private var _sent:Boolean = false;
		
		public function AscentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
		
		public function get sender():PhysicalObject
		{
			return _sender;
		}
		
		public function set sender( value:PhysicalObject ):void
		{
			if ( !_sent )
			{
				_sender = value;
				_sent = true;
			}
			else
			{
				throw new IllegalOperationError( "Cannot set AscentEvent.sender twice.", 1001 );
			}
		}
	}

}
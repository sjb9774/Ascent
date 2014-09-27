package com.ascent.game.basicobject 
{
	import com.ascent.game.basicobject.PhysicalObject;
	import com.ascent.game.event.ControlEvent;
	import com.ascent.game.player.Direction;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class ControlObject extends Combatant
	{
		
		public function ControlObject() 
		{
			
		}
		
		
		public function interact():void
		{
			var interactionEvent:ControlEvent = new ControlEvent( ControlEvent.INTERACT );
			interactionEvent.x = this.direction == Direction.RIGHT ? this.x + this.width : this.x;
			interactionEvent.y = this.y;
			interactionEvent.sender = this;
		}

	}

}
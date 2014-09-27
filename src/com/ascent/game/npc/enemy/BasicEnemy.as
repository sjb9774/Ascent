package com.ascent.game.npc.enemy 
{
	import com.ascent.game.player.BoyAvatar;
	import com.ascent.game.player.Direction;
	import starling.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class BasicEnemy extends Enemy 
	{
		
		public function BasicEnemy() 
		{
			super();
			
			this.maxHealth = 10;
			this.currentHealth = 10;
			this.weight = 50;
			this._frictionMultiplier = 1;
			this.hSpeedModifier = .5;
			this._bounciness = 0;
			this._direction = Direction.RIGHT
			this.airborne = true;
			this.complexAvatar = new BoyAvatar();
			this.addEventListener(Event.ADDED_TO_STAGE , init );
		}
		
		private function init( e:Event ):void
		{
			this.addChild( _complexAvatar );
		}
	}

}
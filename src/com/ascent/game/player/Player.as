package com.ascent.game.player 
{
	import com.ascent.game.attack.Attack;
	import com.ascent.game.attack.Fireball;
	import com.ascent.game.basicobject.ControlObject;
	import com.ascent.game.attack.AttackType;
	import com.ascent.game.event.AttackEvent;
	import com.ascent.game.GameConstants;
	import com.ascent.game.basicobject.ControlObject;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Player extends ControlObject
	{
		public static const INTERACTION_RADIUS:int = 10;

		public function Player( avatar:ComplexAvatar ) 
		{
			this.maxHealth = 100;
			this.currentHealth = 100;
			this.weight = 50;
			this._frictionMultiplier = 1;
			this.hSpeedModifier = 1;
			this._bounciness = 0;
			this._direction = Direction.RIGHT
			this.airborne = true;

			_attacks.push(new GameConstants.PLAYER_START_SPELL( this, _specialDamage + ( _basicDamage * .2 ) ));
			_selectedAttack = _attacks[0];
			
			_complexAvatar = avatar;
			this.addChild( _complexAvatar );
			
		}
		
		override public function attack():void
		{
			//AS3 does not provide a lot of good ways to do this, this is what we have for now
			var attackClass:Class = _selectedAttack.getClass();
			var attackEvent:AttackEvent = new AttackEvent( AttackEvent.ATTACK, new attackClass( this, _specialDamage) );
			dispatchEvent( attackEvent );
			
		}
		

	}

}
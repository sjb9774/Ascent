package com.ascent.game.attack 
{
	import com.ascent.game.basicobject.Combatant;
	import com.ascent.game.player.Direction;
	/**
	 * ...
	 * @author ...
	 */
	public class Fireball extends Attack 
	{
		private static const BASE_DAMAGE:Number = 5;
		
		public function Fireball( caster:Combatant, damageMod:Number ) 
		{
			super( AttackType.FIRE, BASE_DAMAGE * damageMod );
			_projectileType = ProjectileType.SHOT;
			_caster = caster;
			_speed = 20;
			this._weight = 0;
			this.velocity.x = caster.direction == Direction.RIGHT ? _speed : -_speed;
			
		}
		
		override public function getClass():Class
		{
			return Fireball;
		}
		
	}

}
package com.ascent.game.attack 
{
	import com.ascent.game.basicobject.Combatant;
	import com.ascent.game.basicobject.PhysicalObject;
	import com.ascent.game.player.Avatar;
	import com.ascent.game.player.BoyAvatar;
	/**
	 * ...
	 * @author ...
	 */
	
	public class Attack extends Projectile
	{
		
		protected var _actualDamage:Number;
		protected var _damageType:String;
		protected var _projectileType:String;
		protected var _caster:Combatant;
		protected var _speed:Number;
		
		public function Attack( type:String, damage:Number ) 
		{
			this._weight = 0;
			this._frictionMultiplier = 1;
			this._bounciness = 0;
			this.airborne = true;
			this.complexAvatar = new BoyAvatar();
			this.complexAvatar.walkLeft();
			this.addChild( complexAvatar );
			
			//trace( PLAYER_STARTING_ATTACK );
			_actualDamage = damage;
			_damageType = type;
		}
		
		public function getClass():Class
		{
			return Attack;
		}
		
		public function get damage():Number 
		{
			return _actualDamage;
		}
		
		public function set damage(value:Number):void 
		{
			_actualDamage = value;
		}
		
		public function get damageType():String 
		{
			return _damageType;
		}
		
		public function set damageType(value:String):void 
		{
			_damageType = value;
		}
		
		public function get projectileType():String 
		{
			return _projectileType;
		}
		
		public function set projectileType(value:String):void 
		{
			_projectileType = value;
		}
		
		public function get caster():Combatant 
		{
			return _caster;
		}
		
		public function set caster(value:Combatant):void 
		{
			_caster = value;
		}
	}
}
package com.ascent.game.basicobject 
{
	import com.ascent.game.attack.Attack;
	import starling.events.Event;
	import com.ascent.game.event.AnimationEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class Combatant extends MobileObject 
	{
		protected var _maxHealth:int;
		protected var _currentHealth:int;
		protected var _health:int;
		protected var _basicDamage:int;
		protected var _specialDamage:int;
		protected var _basicDefense:int;
		protected var _specialDefense:int;
		protected var _attacks:Vector.<Attack>;
		protected var _selectedAttack:Attack;

		public function Combatant() 
		{
			super();
			_attacks = new Vector.<Attack>();
		}
		
		public function selectAttack( index:int ):void
		{
			if ( index >= 0 && index <= _attacks.length - 1 )
			{
				_selectedAttack = _attacks[index];
			}

		}
		
		public function get health():int 
		{
			return _health;
		}
		
		public function die():void
		{
			this.complexAvatar.die();
			this.complexAvatar.addEventListener( AnimationEvent.DEATH_ANIM_DONE, reallyDie );
			
		}
		
		private function reallyDie( e:Event ):void
		{
			this.complexAvatar.removeEventListener( AnimationEvent.DEATH_ANIM_DONE, reallyDie );
			this.removeFromParent(true);
		}
		
		public function get currentHealth():int 
		{
			return _currentHealth;
		}
		
		public function set currentHealth(value:int):void 
		{
			_currentHealth = value;
			
			//healthbar.refresh();
			if ( _currentHealth <= 0 )
			{
				_currentHealth = 0;
				//die(); no animation yet!
			}
			else if ( _currentHealth > _maxHealth )
			{
				_currentHealth = maxHealth;
			}
		}
		
		public function get maxHealth():int 
		{
			return _maxHealth;
		}
		
		public function set maxHealth(value:int):void 
		{
			_maxHealth = value;
		}
		
		public function set health(value:int):void 
		{
			_health = value;
			//healthbar.refresh();
			if ( _health <= 0 )
			{
				die();
			}
		}
		
		public function attack():void
		{
			//virtual
		}
		
		
		
		
	}

}
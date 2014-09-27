package com.ascent.game.event 
{
	import com.ascent.game.attack.Attack;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class AttackEvent extends AscentEvent
	{
		
		public static const ATTACK:String = "attack";
		protected var _attack:Attack;
		
		public function AttackEvent(type:String, atk:Attack, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			_attack = atk;
		}
		
		public function get attack():Attack 
		{
			return _attack;
		}
		
		public function set attack(value:Attack):void 
		{
			_attack = value;
		}
		
	}

}
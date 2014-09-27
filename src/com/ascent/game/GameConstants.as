package com.ascent.game 
{
	import com.ascent.game.attack.Attack
	import com.ascent.game.attack.Fireball;

	/**
	 * ...
	 * @author ...
	 */
	public class GameConstants 
	{
		public static const TICK_INTERVAL:uint = 1000;
		public static const TICKS_PER_LEVEL:uint = 120;
		public static var PLAYER_START_SPELL:Class = Fireball;

		
		public function GameConstants() 
		{
			
		}
		
	}

}
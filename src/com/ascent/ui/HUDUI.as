package com.ascent.ui 
{
	import com.ascent.game.player.Player;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * ...
	 * @author ...
	 */
	public class HUDUI extends Sprite
	{
		
		public function HUDUI( player:Player ) 
		{
			this.addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( e:Event ):void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, init );
			
		}
		
	}

}
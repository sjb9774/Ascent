package com.ascent.ui 
{
	import com.ascent.game.environment.Environment;
	import com.ascent.game.player.Player;
	import starling.display.Sprite;
	import com.ascent.game.basicobject.Combatant
	import com.ascent.game.event.AscentEvent;
	import com.ascent.ui.components.HealthBar;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FieldUI extends Sprite 
	{
		private var _healthBars:Vector.<HealthBar>;
		private var player:Player
		private var environment:Environment;
		
		public function FieldUI( env:Environment ) 
		{
			super();
			this.player = env.player;
			this.environment = env;
			
			this.addEventListener( Event.ADDED_TO_STAGE, init );
			this.width = env.width;
			this.height = env.height;
			
			
		}
		
		private function init(e:Event):void
		{
			this.environment.addEventListener( AscentEvent.ENEMY_SPAWNED, enemySpawnHandler );
			var playerHealth:HealthBar = new HealthBar( player );
			_healthBars = new Vector.<HealthBar>();
			
			_healthBars.push( playerHealth );
			this.addChild( playerHealth );
		}
		
		public function enemySpawnHandler( e:AscentEvent ):void
		{
			var c:Combatant = e.sender as Combatant;
			var bar:HealthBar = new HealthBar( c );
			_healthBars.push( bar );
			bar.x = c.x - ( bar.width - c.width ) / 2;
			bar.y = c.y - 10;
			this.addChild( bar );
		}
		
		public function onFrame():void
		{
			for each ( var bar:HealthBar in _healthBars )
			{
				trace( bar.x, bar.y );
				bar.refresh();
				bar.x = bar.combatant.x - ( bar.width - bar.combatant.width ) / 2;
				bar.y = bar.combatant.y - 10;
			}
		}
		
	}

}
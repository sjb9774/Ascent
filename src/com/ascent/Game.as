package com.ascent 
{
	import com.ascent.game.basicobject.InteractiveObject;
	import com.ascent.game.control.Controller;
	import com.ascent.game.environment.Environment;
	import com.ascent.game.environment.PhysicsEnvironment;
	import com.ascent.game.level.Level;
	import com.ascent.game.npc.enemy.BasicEnemy;
	import com.ascent.game.player.AndyAvatar;
	import com.ascent.game.player.BoyAvatar;
	import com.ascent.game.player.Player;
	import com.ascent.ui.UIFrame;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.Timer;
	import starling.animation.Juggler;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Sprite;
	import starling.display.Stage;
	import com.ascent.game.GameConstants;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Game extends Sprite
	{
		private var _stage:Stage;
		private var _phys:PhysicsEnvironment;
		private var _env:Environment;
		private var _gameTimer:Timer;
		private var _ui:UIFrame;

		
		
		public function Game( ) 
		{
			this.addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( e:Event ):void
		{
			setUp();
			start();
		}
		private function setUp():void
		{
			gameTimer = new Timer( GameConstants.TICK_INTERVAL );
			Level.parseLevels();
			
			var avatar:BoyAvatar = new BoyAvatar();
			var player:Player = new Player( avatar );
			var level:Level = Level.levels[0];
			_phys = new PhysicsEnvironment( stage );
			var env:Environment = new Environment( player, level, _phys );
			var controller:Controller = new Controller( player );
			var ui:UIFrame = new UIFrame(this);
			_ui = ui;
			_env = env;
			
			stage.addChild( env );
			stage.addChild( controller );
			stage.addChild( ui );
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, keyDown );
			stage.addEventListener( EnterFrameEvent.ENTER_FRAME, enterFrame );
			
			gameTimer.addEventListener( TimerEvent.TIMER, tick );
		}
		public function start():void
		{	
			environment.spawnEnemy( new BasicEnemy(), 200, 20 );
			gameTimer.start();
		}
		
		private function tick( e:TimerEvent ):void
		{
			var t:Timer = e.target as Timer;
			if ( t.currentCount % GameConstants.TICKS_PER_LEVEL == 0 )
			{
				newWave( t.currentCount / GameConstants.TICKS_PER_LEVEL );
			}
		}
		
		private function newWave( waveNum:int ):void
		{
			
		}
		
		private function enterFrame( e:EnterFrameEvent ):void
		{
			_phys.onFrame();
			_env.onFrame();
			_ui.onFrame();

		}
		
		private function keyDown( e:KeyboardEvent ):void
		{
			if ( e.keyCode == Keyboard.UP )
			{
				_env.player.currentHealth += 10;
			}
			else if ( e.keyCode == Keyboard.DOWN )
			{
				_env.player.currentHealth -= 10;
			}
		}
		

		public function get environment():Environment 
		{
			return _env;
		}
		
		public function set environment(value:Environment):void 
		{
			_env = value;
		}
		
		public function get gameTimer():Timer 
		{
			return _gameTimer;
		}
		
		public function set gameTimer(value:Timer):void 
		{
			_gameTimer = value;
		}
	}

}
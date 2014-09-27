package com.ascent.game.environment 
{
	import com.ascent.game.attack.Attack;
	import com.ascent.game.basicobject.Combatant;
	import com.ascent.game.basicobject.PhysicalObject;
	import com.ascent.game.event.AscentEvent;
	import com.ascent.game.level.blocks.Block;
	import com.ascent.game.level.Level;
	import com.ascent.game.npc.enemy.Enemy;
	import com.ascent.game.player.Player;
	import flash.errors.IllegalOperationError;
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	import com.ascent.game.event.ControlEvent;
	import flash.events.Event;
	import com.ascent.game.event.AttackEvent;
	import com.ascent.game.player.Direction;
	import com.ascent.game.level.blocks.BlockStandards;
	/**
	 * Represents the level being played as a whole. Contains the Player object, a PhysicsEnvironmentObject which determines
	 * how the player and NPCs can move through the Level object also contained by Environment, defining boundaries for movement,
	 * walls, floors, ceilings, etc, as well as texturing information.
	 * 
	 * @author Stephen Biston
	 * 
	 */
	public class Environment extends Sprite
	{
		private var _player:Player;
		private var _enemies:Vector.<Enemy>;
		private var _level:Level;
		private var _physics:PhysicsEnvironment;
		
		private var _baseV:Number = 20;
		private var _v:Number = 20;
		private var _terminalV:Number = 10;
		
		/**
		 * Creates a new Environment object. An Environment generally corresponds to a single world or level that a player may play on.
		 * 
		 * @param	player The Player object that will be controlled by the user and directed through the Environment.
		 * @param	level The Level object that defines the walls, floors, obstacles, boundaries, and textures for the Environment.
		 * @param	physics The PhysicsEnvironment object that controls how the player and NPCs can move through the Environment.
		 */
		public function Environment( player:Player, level:Level, physics:PhysicsEnvironment ) 
		{
			_player = player;
			_level = level;
			_physics = physics;
			_enemies = new Vector.<Enemy>();
			
			setUpEnvironment();
			
		}
		
		/**
		 * Initializes the environment for play; registers event listeners for the player to interact with the environment,
		 * adds the level's tiles and the player to the physics engine, activates the physics engine to being affecting
		 * it's objects, and then displays the level to the user.
		 */
		private function setUpEnvironment():void
		{
			_player.addEventListener( AttackEvent.ATTACK, attackHandler );
			
			addLevelToPhysics( _level, _physics );
			
			_physics.addObject( player );
			_physics.start();
			
			this.display();
		}
		/**
		 * Displays the visual components of the Environment on its own stage. This method should be called with this
		 * Environment object added as a child to the main Stage (or as child of child of the main Stage, etc ).
		 */
		public function display():void
		{
			_player.x = 20
			_player.y = 100;
			_level.renderLevel();
			this.addChild( _level );
			this.addChild( _player );
		}
		
		public function spawnEnemy( enemy:Enemy, x:int, y:int ):void
		{
			_enemies.push( enemy );
			enemy.x = x;
			enemy.y = y;
			_physics.addObject( enemy );
			this.addChild( enemy );
			var spawnEvent:AscentEvent = new AscentEvent( AscentEvent.ENEMY_SPAWNED );
			spawnEvent.sender = enemy;
			this.dispatchEvent( spawnEvent );
		}
		
		private function addLevelToPhysics( level:Level, physics:PhysicsEnvironment = null ):void
		{
			var phy:PhysicsEnvironment = physics ? physics : this._physics;
			for each( var block:Block in level.wallBlocks )
			{
				block.x = block.xIndex * BlockStandards.BLOCK_SIZE;
				block.y = block.yIndex * BlockStandards.BLOCK_SIZE;
				block._active = false;
				phy.addObstacle( block );
			}
		}
		/**
		 * Private. Determines what happens when an AttackEvent is heard from a combatant.
		 * 
		 * 
		 * @param	e The AttackEvent dispatched from the Combatant object performing the attack.
		 */
		private function attackHandler( e:AttackEvent ):void
		{
			var atk:Attack = e.attack;
			var c:Combatant = atk.caster;
			var x:Number = c.x;
			var y:Number = c.y;
			
			atk.x = x;
			atk.y = y;
			
			_physics.addObject( atk );
			this.addChild( atk );
		}
		
		/**
		 * Gets or sets the Player object associated with this Environment. Settings the Player object with a new Player will
		 * remove the old Player object from the Environment.
		 */
		public function get player():Player
		{
			return _player;
		}
		
		public function set player( value:Player ):void
		{
			this.removeChild( _player );
			this.addChild( value );
			_player = value;
			_player.addEventListener( ControlEvent.INTERACT, interactionEventHandler );
		}
		
		private function interactionEventHandler( e:ControlEvent ):void
		{
			var dirFactor:int = player.direction == Direction.LEFT ? -1 : 1;
			for each( var block:Block in level.interactiveBlocks )
			{
				
				if ( e.x + dirFactor * Player.INTERACTION_RADIUS >= block.x &&
					 e.x + dirFactor * Player.INTERACTION_RADIUS <= block.x + BlockStandards.BLOCK_SIZE &&
					 e.y <= block.y + BlockStandards.BLOCK_SIZE && e.y + e.sender.height > block.y )
				{
					trace( "interacting" );
				}
			}
		}
		
		/**
		 * Read-only. Returns the Level object associated with this Environment. If you wish to set a new level to an Environment,
		 * it is advised that you create a new Environment wit th desired Level and Player instead.
		 */
		public function get level():Level
		{
			return _level;
		}
		
		public function set level( value:Level ):void
		{
			_level = value;
		}
		
		public function onFrame():void
		{
			for each ( var enemy:Enemy in _enemies )
			{
				if ( player.x < enemy.x - enemy.width*1.5 ) enemy.moveLeft();
				else if ( player.x > enemy.x + enemy.width*1.5 ) enemy.moveRight();
				else enemy.stop();
				if ( player.y < enemy.y ) enemy.jump();
			}
		}
		
	}

}
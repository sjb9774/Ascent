package com.ascent.game.basicobject 
{
	import com.ascent.game.event.ControlEvent;
	import com.ascent.game.player.Direction;
	import flash.events.Event;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	 
	public class MobileObject extends PhysicalObject
	{
		private var _hSpeedModifier:Number;
		private var _vSpeedModifier:Number;
		
		protected var _movingLeft:Boolean;
		protected var _movingRight:Boolean;
		
		protected var _direction:String;
		
		public function MobileObject() 
		{
			_hSpeedModifier = 1;
			_vSpeedModifier = 1;
			_weight = 1;
		}
		
		public function moveRight():void
		{
			if ( !movingRight )
			{
				movingRight = true;
				direction = Direction.RIGHT;
			}
		
		}
		
		public function moveLeft():void
		{
			if ( !movingLeft ) 
			{
				movingLeft = true;
				direction = Direction.LEFT;
			}
		}
		
		public function stop():void
		{
			movingLeft, movingRight = false, false;
			_complexAvatar.animate();
		}
		
		
		public function jump():void
		{

			if ( this.airborne ) return;
			this.airborne = true;
			this.velocity.y = -10;

			if ( !airborne ) 
			{
				dispatchEvent( new ControlEvent( ControlEvent.JUMP, true ) );
			}
		}
		
		public function crouch():void
		{
			//virtual
		}
		
		public function get hSpeedModifier():Number
		{
			return _hSpeedModifier
		}
		
		public function get vSpeedModifier():Number
		{
			return _vSpeedModifier;
		}
		
		public function get weight():Number
		{
			return _weight;
		}
		
		public function get movingLeft():Boolean
		{
			return _movingLeft;
		}
		
		public function get movingRight():Boolean
		{
			return _movingRight;
		}
		
		public function get direction():String
		{
			return _direction;
		}
		
		public function set hSpeedModifier( value:Number ):void
		{
			_hSpeedModifier = value;
		}
		
		public function set vSpeedModifier( value:Number ):void
		{
			_vSpeedModifier = value;
		}
		
		public function set weight( value:Number ):void
		{
			if ( value < 0 ) weight = 0;
			else _weight = value;
		}
		
		public function set movingRight( value:Boolean ):void
		{
			if ( movingLeft ) movingLeft = false;
			_complexAvatar.walkRight();
			if ( !airborne ) 
			{
				if ( value )
				{
					this.velocity.x = 5 * hSpeedModifier;
				}
				else
				{
					this.velocity.x = 0;
				}
			}
			else
			{
				if ( value ) this.velocity.x = 2 * hSpeedModifier;
			}
			_movingRight = value;
		}
		
		public function set movingLeft( value:Boolean ):void
		{
			if ( movingRight ) movingRight = false;
			_complexAvatar.walkLeft();
			if ( !airborne ) 
			{
				if ( value )
				{
					this.velocity.x = -5 * hSpeedModifier;
				}
				else
				{
					this.velocity.x = 0;
				}
			}
			else
			{
				if ( value ) this.velocity.x = -2 * hSpeedModifier;
			}
			_movingLeft = value;
		}
		
		override public function set airborne( value:Boolean ):void
		{
			trace( "setting airborne to " + value );
			if ( value )
			{
				//placeholder
			}
			else
			{
				//if left button is held and the player is hitting the ground (airborne being set to false)
				if ( movingLeft ) this.velocity.x = -5 * hSpeedModifier;
				//if right button is held and player is hitting the ground
				else if ( movingRight ) this.velocity.x = 5 * hSpeedModifier;
				//if neither button is held and the player hits the ground
				else this.velocity.x = 0;
			}
			_airborne = value;
		}
		
		public function set direction( value:String ):void
		{
			if ( _direction != value )
			{
				if ( value == Direction.LEFT ) {
					complexAvatar.scaleX = -1;
					_complexAvatar.x += _complexAvatar.width;
				}
				else if ( value == Direction.RIGHT ) {
					complexAvatar.scaleX = 1;
					_complexAvatar.x -= _complexAvatar.width;
				}
				_direction = value;
			}
		}
		
	}

}
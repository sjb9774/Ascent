package com.ascent.game.basicobject
{
	import com.ascent.game.basicobject.MobileObject;
	import com.ascent.game.player.ComplexAvatar;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class PhysicalObject extends InteractiveObject
	{
		
		public var _weight:Number;
		private var _velocity:Point;
		public var _bounciness:Number;
		public var _name:String;
		public var _frictionMultiplier:Number;
		public var _active:Boolean = true;
		public var _airborne:Boolean;
		protected var _complexAvatar:ComplexAvatar;
		
		private var _bottomCenter:Point;
		
		public function PhysicalObject()
		{
			super();
			_velocity = new Point();
		
		}
		
		public function reverseVelocity():Point
		{
			velocity.x = -velocity.x;
			velocity.y = -velocity.y;
			
			return velocity;
		}
		
		public function getBottomCenter():Point
		{
			var pt:Point;
			if (!_bottomCenter || (_bottomCenter.x != this.x + this.width / 2 && _bottomCenter.y != this.y + this.height))
			{
				pt = new Point(this.x + this.width / 2, this.y + this.height);
			}
			else
			{
				pt = _bottomCenter;
			}
			return pt;
		}
		
		public function get velocity():Point
		{
			return _velocity;
		}
		
		public function set velocity(value:Point):void
		{
			_velocity.x = Number(value.x.toFixed(4));
			_velocity.y = Number(value.y.toFixed(4));
		}
		
		public function get momentum():Number
		{
			return _weight * velocity.length;
		}
		
		public function set airborne(value:Boolean):void
		{
			_airborne = value;
		}
		
		public function get airborne():Boolean
		{
			return _airborne;
		}
		
		public function get complexAvatar():ComplexAvatar 
		{
			return _complexAvatar;
		}
		
		public function set complexAvatar(value:ComplexAvatar):void 
		{
			_complexAvatar = value;
		}
	
	}

}
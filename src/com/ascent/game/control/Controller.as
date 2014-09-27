package com.ascent.game.control 
{
	import com.ascent.game.basicobject.ControlObject;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.events.Event;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Controller extends Sprite
	{
		
		private var _controlObject:ControlObject;
		public static var controlMode:String = "wsad";
		
		private var _upKey:uint;
		private var _downKey:uint;
		private var _leftKey:uint;
		private var _rightKey:uint;
		private var _attackKey:uint = Keyboard.SPACE;
		
		public function Controller( controlObj:ControlObject ) 
		{
			_controlObject = controlObj;
			
			setControlMode( Controller.controlMode );
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage );
		}
		
		public function setControlMode( mode:String ):Boolean
		{
			if ( mode == ControllerMode.WSAD )
			{
				upKey = Keyboard.W;
				downKey = Keyboard.S;
				leftKey = Keyboard.A;
				rightKey = Keyboard.D;
				controlMode = mode;
				return true;
			}
			else if ( mode == ControllerMode.ARROWS )
			{
				upKey = Keyboard.UP;
				downKey = Keyboard.DOWN;
				leftKey = Keyboard.LEFT;
				rightKey = Keyboard.RIGHT;
				controlMode = mode;
				return true;
			}
			else
			{
				return false;
			}
		}
		
		private function keyDown( e:KeyboardEvent ):void
		{
			var string:String = "";
			if ( e.ctrlKey ) string += "CONTROL + ";
			if ( e.shiftKey ) string += "SHIFT + ";
			if ( e.altKey ) string += "ALT + ";
			
			string += e.keyCode.toString();
			
			if ( e.keyCode == upKey ) controlObject.jump();
			else if ( e.keyCode == downKey ) controlObject.crouch();
			else if ( e.keyCode == rightKey ) controlObject.moveRight();
			else if ( e.keyCode == leftKey ) controlObject.moveLeft();
			else if ( e.keyCode == attackKey ) controlObject.attack();
			
		}
		
		private function keyUp( e:KeyboardEvent ):void
		{
			if ( e.keyCode == leftKey ) controlObject.stop();
			else if ( e.keyCode == rightKey ) controlObject.stop();
		}
		private function addedToStage( e:Event ):void
		{
			this.x = 0;
			this.y = 0;
			this.width = parent.width;
			this.height = parent.height;
			
			this.stage.addEventListener( KeyboardEvent.KEY_DOWN, keyDown );
			this.stage.addEventListener( KeyboardEvent.KEY_UP, keyUp );
			
		}
		
		
		public function set upKey( value:uint ):void
		{
			_upKey = value;
		}
		
		public function set downKey( value:uint ):void
		{
			_downKey = value;
		}
		
		public function set leftKey( value:uint ):void
		{
			_leftKey = value;
		}
		
		public function set rightKey( value:uint ):void
		{
			_rightKey = value;
		}
		
		public function set attackKey( value:uint ):void
		{
			attackKey = value;
		}
		
		public function get upKey():uint
		{
			return _upKey;
		}
		
		public function get downKey():uint
		{
			return _downKey;
		}
		
		public function get leftKey():uint
		{
			return _leftKey;
		}
		
		public function get rightKey():uint
		{
			return _rightKey;
		}
		
		public function get attackKey():uint
		{
			return _attackKey;
		}

		
		public function get controlObject():ControlObject
		{
			return _controlObject;
		}
	}

}
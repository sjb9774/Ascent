package com.ascent.game.basicobject 
{
	import com.ascent.game.event.InteractionEvent;
	import starling.display.Sprite;
	import com.ascent.game.player.Avatar;
	/**
	 * Base class for all objects that the player or NPCs can attack, destroy, activate, or otherwise interact with.
	 * @author Stephen Biston
	 * 
	 */
	 
	public class InteractiveObject extends Sprite
	{
		private var _solid:Boolean;
		protected var _avatar:Avatar;

		
		/**
		 * Base class for all objects that the player or NPCs can attack, destroy, activate, or otherwise interact with.
		 */
		public function InteractiveObject() 
		{
			
		}
		
		/**
		 * Activates the object. Activated objects are available affected by all the environments, physics, 
		 * and other InteractiveObjects they are associated with.
		 */
		public function activate():void
		{
			
		}
		
		/**
		 * This function will be executed whenever the player interacts with this object.
		 */
		public function onInteract():void
		{
			//implemented in subclasses
		}
		
		/**
		 * Gets or sets a true/false value determining whether or not other InteractiveObjects can pass through this object.
		 */
		public function get solid():Boolean
		{
			return _solid;
		}
		
		private function set solid( value:Boolean ):void
		{
			_solid = value;
		}
		
		public function get avatar():Avatar
		{
			return _avatar;
		}
		
		public function set avatar( value:Avatar ):void
		{
			_avatar = value;
		}
		

	
	}

}
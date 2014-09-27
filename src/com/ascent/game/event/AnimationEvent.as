package com.ascent.game.event 
{
	/**
	 * ...
	 * @author ...
	 */
	public class AnimationEvent extends AscentEvent
	{
		public static const DEATH_ANIM_DONE:String = "death animation done";
		
		public function AnimationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}

}
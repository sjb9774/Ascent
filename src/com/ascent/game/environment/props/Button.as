package com.ascent.game.environment.props 
{
	import com.ascent.game.basicobject.InteractiveObject;
	import com.ascent.game.event.InteractionEvent;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Button extends InteractiveObject
	{
		
		public function Button( linkTag:String ) 
		{
			this.tag = linkTag;
		}
		
		override public function onInteract():void
		{
			var iEvent:InteractionEvent = new InteractionEvent( InteractionEvent.BUTTON_PRESSED );
			iEvent.tag = this.tag;
		}
		
	}

}
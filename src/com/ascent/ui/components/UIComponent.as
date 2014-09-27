package com.ascent.ui.components 
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class UIComponent extends Sprite 
	{
		protected var _backgroundColor:int;
		protected var _foregroundColor:int;
		
		public function UIComponent() 
		{
			super();
			this.addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		protected function draw():void {}
		
		private function init( e:Event ):void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, init );
			draw();
		}
	}

}
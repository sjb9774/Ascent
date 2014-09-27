package com.ascent.ui 
{
	import com.ascent.Game;
	import com.ascent.game.basicobject.Combatant;
	import com.ascent.ui.components.HealthBar;
	import starling.display.Sprite;
	import starling.events.Event;
	import com.ascent.game.event.AscentEvent;
	import com.ascent.ui.HUDUI;
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	/**
	 * The UI main-brain for the whole god damn game.
	 * @author ...
	 */
	public class UIFrame extends Sprite 
	{
		private var healthBars:Vector.<HealthBar>;
		
		private var game:Game;
		private var fieldUI:FieldUI;
		private var hudUI:HUDUI;
		
		public function UIFrame( g:Game ) 
		{
			super();
			this.game = g;
			this.addEventListener(Event.ADDED_TO_STAGE, init );
			
		}
		
		private function init( e:Event ):void
		{
			
			hudUI = new HUDUI( game.environment.player );
			fieldUI = new FieldUI( game.environment );
			
			this.width = game.width;
			this.height = game.height;
			
			this.addChild(fieldUI);

		}
		
		
		//redraw all changing UI components
		public function onFrame():void
		{
			fieldUI.onFrame();
		}
		
	}

}
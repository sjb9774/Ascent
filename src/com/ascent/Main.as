package com.ascent
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;

	/**
	 * ...
	 * @author Stephen Biston
	 */
	[Frame(factoryClass="com.ascent.Preloader")]
	public class Main extends Sprite 
	{
		private var _starling:Starling;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startGame();
		}
		
		private function startGame():void
		{
			_starling = new Starling( Game, stage );
			
			_starling.start();
		}

	}

}
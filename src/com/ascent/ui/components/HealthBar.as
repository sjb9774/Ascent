package com.ascent.ui.components 
{
	import com.ascent.game.basicobject.Combatant;
	import starling.display.Shape;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class HealthBar extends UIComponent
	{
		private var _maxHealth:int;
		private var _currentHealth:int;
		private var _backgroundBar:Shape;
		private var _foregroundBar:Shape;
		private var _combatant:Combatant;
		private var _size:int;
		
		public static const HEALTH_BAR_SMALL:int = 40;
		public static const HEALTH_BAR_MEDIUM:int = 80;
		public static const HEALTH_BAR_LARGE:int = 120;
		
		public function HealthBar( comb:Combatant, size:int = HEALTH_BAR_SMALL ) 
		{
			super();
			_size = size;
			_currentHealth = comb.currentHealth;
			_maxHealth = comb.maxHealth;
			_combatant = comb;
			_backgroundColor = 0x3d3d3d;
			_foregroundColor = 0x00cc00;
		}
		
		override protected function draw():void
		{
			var bg:Shape = new Shape();
			var fg:Shape = new Shape();
			var red:Shape = new Shape();
			
			bg.graphics.beginFill( _backgroundColor );
			bg.graphics.drawRect( 0, 0, _size, _size / 8  );
			bg.graphics.endFill();
			_backgroundBar = bg;
			this.addChild( _backgroundBar );
			
			red.graphics.beginFill( 0xdd0000 );
			red.graphics.drawRect( 1, 1, _size - 2, (_size/8) - 2  );
			red.graphics.endFill();
			this.addChild(red);
			
			fg.graphics.beginFill( _foregroundColor );
			fg.graphics.drawRect( 1, 1, _size - 2, (_size/8) - 2  );
			fg.graphics.endFill();
			_foregroundBar = fg;
			this.addChild( _foregroundBar );			
		}
		
		public function refresh():void
		{
			if ( !stage ) return;
			_foregroundBar.alpha = _currentHealth / _maxHealth + .25;
			_currentHealth = _combatant.currentHealth;
			_maxHealth = _combatant.maxHealth;
			_foregroundBar.scaleX = ( _currentHealth/_maxHealth );
		}
		
		public function get combatant():Combatant 
		{
			return _combatant;
		}
		
		public function set combatant(value:Combatant):void 
		{
			_combatant = value;
		}
	}

}
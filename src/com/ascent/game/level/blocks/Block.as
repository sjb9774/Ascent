package com.ascent.game.level.blocks
{
	import com.ascent.game.basicobject.PhysicalObject;
	import starling.textures.Texture;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Block extends PhysicalObject
	{
		protected var _solid:Boolean;
		protected var _x:int;
		protected var _y:int;
		protected var _type:int;
		protected var _texture:Texture
		
		public function Block(xpos:int, ypos:int, type:int, solid:Boolean = true)
		{
			_x = xpos;
			_y = ypos;
			_type = type;
			_solid = solid;
			
			this._texture = BlockMap.getTexture( type );
			var i:Image = new Image( _texture );
			i.width = BlockStandards.BLOCK_SIZE;
			i.height = BlockStandards.BLOCK_SIZE;
			this.addChild( i );
		}
		
		public static function getBlockFromString(str:String):Block
		{
			var x:int = int(str.substr(0, 2 ));
			var y:int = int(str.substr( 2, 2 ));
			var type:int = int(str.substr(4, 3));
			var solidNum:int = int(str.charAt(str.length - 1));
			var solid:Boolean = solidNum == 1 ? true : false;
			trace( x, y, type, solid );
			return new Block(x, y, type, solid);
		}
		
		public function get yIndex():int
		{
			return _y;
		}
		
		public function get xIndex():int
		{
			return _x;
		}
		
		public function get type():int 
		{
			return _type;
		}
	
	}
}
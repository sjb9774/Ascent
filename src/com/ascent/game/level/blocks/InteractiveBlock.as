package com.ascent.game.level.blocks 
{
	import com.ascent.game.basicobject.InteractiveObject;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class InteractiveBlock extends Block
	{
		
		private var _tag:String;
		
		public function InteractiveBlock(xpos:int, ypos:int, type:int, tag:String, solid:Boolean = true) 
		{
			super( xpos, ypos, type, solid );
			this.tag = tag;
		}
		
		override public function onInteract():void
		{
			
		}
		
		public static function getBlockFromString( blockString:String ):InteractiveBlock
		{
			//todo
			return new InteractiveBlock( 0, 0, 0, "none");
		}
		
		public function get tag():String
		{
			return _tag;
		}
		
		public function set tag( value:String ):void
		{
			_tag = value;
		}
		
	}

}
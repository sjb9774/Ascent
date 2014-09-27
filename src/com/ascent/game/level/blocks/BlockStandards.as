package com.ascent.game.level.blocks 
{
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class BlockStandards 
	{
		public static const BLOCK_SIZE:int = 32;
		public function BlockStandards() 
		{
			
		}
		
		
		public static function isBasic( block:Block ):Boolean
		{
			return block.type >= 100 && block.type < 200
		}
		
		static public function isInteractive(block:Block):Boolean
		{
			return block.type >= 200 && block.type < 300;
		}
	}

}
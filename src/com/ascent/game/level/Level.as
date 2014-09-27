package com.ascent.game.level
{
	import com.ascent.game.basicobject.EnvironmentObject;
	import com.ascent.game.basicobject.InteractiveObject;
	import com.ascent.game.level.blocks.Block;
	import com.ascent.game.level.blocks.BlockStandards;
	import com.ascent.game.level.blocks.InteractiveBlock;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import starling.display.Image;
	import starling.display.Sprite;
	import com.ascent.game.level.blocks.BlockMap;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class Level extends Sprite
	{
		
		[Embed(source="../../../../../assets/levelxml/Levels.xml",mimeType="application/octet-stream")]
		public static const LevelXML:Class;
		
		public static var levels:Vector.<Level> = new Vector.<Level>();
		
		public var wallBlocks:Vector.<Block>;
		public var prettyBlocks:Vector.<Block>;
		public var interactiveBlocks:Vector.<InteractiveBlock>;
		
		public function Level()
		{
			wallBlocks = new Vector.<Block>();
			prettyBlocks = new Vector.<Block>();
			interactiveBlocks = new Vector.<InteractiveBlock>();
			
		}
		
		public static function parseLevels():void
		{
			var xml:XML = new XML(new LevelXML());
			
			for each (var levelString:XML in xml.children())
			{
				var lvl:Level = new Level();
				for each (var blockString:String in levelString.wallblocks.split("-"))
				{
					var block:Block = Block.getBlockFromString(blockString);
					
					lvl.wallBlocks.push(block);
				}
				
				for each (var iBlockString:String in levelString.interactiveblocks.split("-"))
				{
					if ( iBlockString.length < 1 ) continue;
					
					var iblock:InteractiveBlock = InteractiveBlock.getBlockFromString( iBlockString );
					if ( iblock.solid ) lvl.wallBlocks.push( iblock );
					
					lvl.interactiveBlocks.push( iblock );
				}
				
				for each ( var eObjString:String in levelString.environmentobjects.split("-") )
				{
					var eObj:EnvironmentObject = EnvironmentObject.getObjectFromString( eObjString );
					
				}
				
				Level.levels.push(lvl);
			}
		}
		
		public function renderLevel():void
		{
			for each (var block:Block in this.wallBlocks)
			{/*
				var i:Image = new Image(BlockMap.getTexture(block.type));
				i.x = block.x * BlockStandards.BLOCK_SIZE;
				i.y = block.y * BlockStandards.BLOCK_SIZE;
				i.width = BlockStandards.BLOCK_SIZE;
				i.height = BlockStandards.BLOCK_SIZE;*/
				this.addChild(block);
			}
			
			for each (var block1:Block in this.interactiveBlocks)
			{
				/*
				var j:Image = new Image(BlockMap.getTexture(block1.type));
				j.x = block1.x * BlockStandards.BLOCK_SIZE;
				j.y = block1.y * BlockStandards.BLOCK_SIZE;
				j.width = BlockStandards.BLOCK_SIZE;
				j.height = BlockStandards.BLOCK_SIZE;*/
				this.addChild(block1);
			}
			
			for each (var block2:Block in this.prettyBlocks)
			{
				/*
				var k:Image = new Image(BlockMap.getTexture(block2.type));
				k.x = block2.x * BlockStandards.BLOCK_SIZE;
				k.y = block2.y * BlockStandards.BLOCK_SIZE;
				k.width = BlockStandards.BLOCK_SIZE;
				k.height = BlockStandards.BLOCK_SIZE;*/
				this.addChild(block2);
			}
		}
		

	
	}

}
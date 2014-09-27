package com.ascent.game.level.blocks 
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class BlockMap 
	{
		[Embed(source = "../../../../../../assets/textures/textures.png")]
		private  static var TextureSheet:Class;
		
		[Embed(source = "../../../../../../assets/textures/textures.xml", mimeType="application/octet-stream")]
		private static var TextureXML:Class;
		
		private static var masterAtlas:TextureAtlas;
		private static var masterXML:XML;
		private static var _missingTexture:Texture;
		
		public function BlockMap() 
		{
			
		}
		
		public static function getTexture(type:int):Texture
		{
			if ( !masterAtlas || !masterXML )
			{
				masterXML = new XML( new TextureXML() );
				var txtr:Texture = Texture.fromEmbeddedAsset( TextureSheet );
				masterAtlas = new TextureAtlas( txtr, masterXML );
			}
			
			var texture:Texture = masterAtlas.getTexture( type.toString() );;
			texture = texture ? texture : getMissingTexture();
			return texture;
		}
		
		private static function getMissingTexture():Texture
		{
			if ( !_missingTexture ) _missingTexture = masterAtlas.getTexture( "missing" );
			return _missingTexture;
		}
	}

}
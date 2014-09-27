package com.ascent.game.player 
{
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class BoyAvatar extends ComplexAvatar 
	{
		[Embed(source = "../../../../../assets/boywalk/newpack.png")]
		private var WalkSpriteSheet:Class;
		
		[Embed(source = "../../../../../assets/boywalk/newpack.xml", mimeType="application/octet-stream")]
		private var WalkXML:Class;
		
		private static var _spriteSheet:TextureAtlas;
		private static var _xml:XML;
		
		public static const SPRITESHEET:String = "walk right "
		public static const FRAMERATE:int = 24;
		
		public function BoyAvatar() 
		{
			super();
			var walkClip:MovieClip = new MovieClip( getSpriteSheet().getTextures(SPRITESHEET), FRAMERATE );
			var walkClipCopy:MovieClip = new MovieClip( getSpriteSheet().getTextures(SPRITESHEET), FRAMERATE );
			var standClip:MovieClip = new MovieClip( getSpriteSheet().getTextures(SPRITESHEET + "1" ) );
			
			defaultClip = standClip;
			walkLeftClip = walkClipCopy;
			walkRightClip = walkClip;
			animate();
			addChild( defaultClip )
			addChild( walkLeftClip );
			addChild( walkRightClip );
		}
		
		private function getSpriteSheet():TextureAtlas
		{
			if ( !_spriteSheet )
			{
				var texture:Texture = Texture.fromEmbeddedAsset( WalkSpriteSheet );
				var xml:XML = getXML();
				_spriteSheet = new TextureAtlas( texture, xml );
			}
			return _spriteSheet;
		}
		
		private function getXML():XML
		{
			if ( !_xml )
			{
				_xml = new XML( new WalkXML() );
			}
			return _xml;
		}
	}

}
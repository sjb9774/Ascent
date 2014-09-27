package com.ascent.game.basicobject 
{
	import com.ascent.game.basicobject.InteractiveObject;
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class EnvironmentObject extends InteractiveObject 
	{
		
		private var _repeatable:Boolean;
		private var _tag:String;
		private var _xIndex:int;
		private var _yIndex:int;
		private var _functionId:int;
		private var _textureId:int;
		private var _orientation:String;
		
		public function EnvironmentObject( xPos:int, yPos:int, fID:int, tID:int, linkTag:String, orient:String ) 
		{
			xIndex = xPos;
			yIndex = yPos;
			functionId = fID;
			textureId = tID;
			tag = linkTag;
			orientation = orient;
			
		}
		
		public static function getObjectFromString( objectString:String ):EnvironmentObject
		{
			/**
			 * The objects defined in the xml file are defined by 11 characters using the following format
			 * 		1122201201AR
			 * { 2 characters defining xIndex, 2 characters defining yIndex, 3 characters defining functionality id,
			 * 	 3 characters defining texture id, 1 character defining its tag, 1 character defining orientation on its parent block }
			 */
			var obj:InteractiveObject;
			var xIndex:int = parseInt( objectString.substr(0, 2) );
			var yIndex:int = parseInt( objectString.substr(2, 2) );
			var functionalID:int = parseInt( objectString.substr( 4, 3 ) );
			var txtrId:int = parseInt( objectString.substr( 7, 3 ) );
			var linkTag:String = objectString.substr( 9, 1 );
			var orient:String = objectString.substr( 10, 1 );
			
			return new EnvironmentObject( xIndex, yIndex, functionalID, txtrId, linkTag, orient );
		}
		
		
		public function get repeatable():Boolean
		{
			return _repeatable;
		}
		
		public function set repeatable( value:Boolean ):void
		{
			_repeatable = value;
		}
		
		public function get xIndex():int 
		{
			return _xIndex;
		}
		
		public function set xIndex(value:int):void 
		{
			_xIndex = value;
		}
		
		public function get yIndex():int 
		{
			return _yIndex;
		}
		
		public function set yIndex(value:int):void 
		{
			_yIndex = value;
		}
		
		public function get functionId():int 
		{
			return _functionId;
		}
		
		public function set functionId(value:int):void 
		{
			_functionId = value;
		}
		
		public function get textureId():int 
		{
			return _textureId;
		}
		
		public function set textureId(value:int):void 
		{
			_textureId = value;
		}
		
		public function get orientation():String 
		{
			return _orientation;
		}
		
		public function set orientation(value:String):void 
		{
			_orientation = value;
		}
		
		public function get tag():String 
		{
			return _tag;
		}
		
		public function set tag(value:String):void 
		{
			_tag = value;
		}
		
	}

}
package com.ascent.game.player 
{
	import AndyStand;
	import AndyWalk;
	import starling.display.MovieClip;
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public class AndyAvatar extends ComplexAvatar 
	{
		
		public function AndyAvatar() 
		{
			defaultClip = new AndyStand();
			walkRightClip = new AndyWalk();
			walkLeftClip = new AndyWalk();
			
			defaultClip.stop();
			defaultClip.visible = false;
			
			walkRightClip.stop();
			walkRightClip.visible = false;
			
			walkLeftClip.stop();
			walkLeftClip.visible = false;
			
			addChild( defaultClip );
			addChild( walkLeftClip );
			addChild( walkRightClip );
			
			currentClip = defaultClip;
			animate();
		}
		
		public function playCurrent():void
		{
			currentClip.visible = true;
			currentClip.gotoAndPlay(1);
		}
		
		override public function animate():void
		{
			currentClip.visible = false;
			currentClip = defaultClip;
			playCurrent();
		}
		
		override public function walkRight():void
		{
			currentClip.visible = false;
			currentClip = walkRightClip;
			playCurrent();
		}
		
		override public function walkLeft():void
		{
			currentClip.visible = false;
			currentClip = walkLeftClip;
			playCurrent();
		}
		
	}

}
package com.ascent.game.interfaces 
{
	
	/**
	 * ...
	 * @author Stephen Biston
	 */
	public interface IComplexAnimator extends IAnimator
	{
		function walkLeft():void
		function walkRight():void
		function stand():void
		function jump():void
		function fall():void
		function spawn():void
		function die():void
		function attack():void
	}
	
}
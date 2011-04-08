package com.theredspace.model{
	import org.robotlegs.mvcs.Actor;
	
	public class GameModel extends Actor{
		[Embed(source='assets/images/creature1.png')]
		public var creature1:Class;
		
		[Embed(source='assets/images/creature2.png')]
		public var creature2:Class;
		
		[Embed(source='assets/images/creature3.png')]
		public var creature3:Class;
		
		public var zoopArr:Array = new Array();
	}
}
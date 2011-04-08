package com.theredspace.commands{
	import com.theredspace.components.Zoop;
	import com.theredspace.model.GameModel;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class KillZoops extends SignalCommand{
		[Inject]public var model:GameModel;
		override public function execute():void{
			for(var i:int = 0; i < model.zoopArr.length;i++){
				(model.zoopArr[i] as Zoop).killZoop();
			}
		}
	}
}
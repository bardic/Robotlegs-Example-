package com.theredspace.mediator{
	import com.theredspace.components.AppControlBar;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class AppControlBarMediator extends Mediator{
		[Inject]public var view:AppControlBar
		override public function onRegister():void{
			
		}
	}
}
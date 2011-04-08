package com.theredspace.mediator{
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator{		
		[Inject]public var view:RobotlegsPresentation;
		override public function onRegister():void{
			
		}
	}
}
package com.theredspace.mediator{
	import com.theredspace.components.UberControls;
	import com.theredspace.signals.AddZoopSignal;
	import com.theredspace.signals.KillZoopsSignal;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class UberControlsMediator extends Mediator{
		[Inject]public var view:UberControls;
		[Inject]public var addZoopSignal:AddZoopSignal;
		[Inject]public var killZoopsSignal:KillZoopsSignal;
		override public function onRegister():void{
			view.addEventListener(UberControls.CREATURE_CONTROL_1_CLICKED ,onCreatureClicked);
			view.addEventListener(UberControls.CREATURE_CONTROL_2_CLICKED ,onCreatureClicked);
			view.addEventListener(UberControls.CREATURE_CONTROL_3_CLICKED ,onCreatureClicked);
			view.addEventListener(UberControls.CREATURE_CLEAR_CLICKED, onClearCreatures);
		}
		
		private function onCreatureClicked(ev:Event):void{
			switch(ev.type){
				case UberControls.CREATURE_CONTROL_1_CLICKED:
					addZoopSignal.dispatch(1);
				break;
				case UberControls.CREATURE_CONTROL_2_CLICKED:
					addZoopSignal.dispatch(2);
				break;
				case UberControls.CREATURE_CONTROL_3_CLICKED:
					addZoopSignal.dispatch(3);
				break;
			}			
		}
		
		private function onClearCreatures(ev:Event):void{
			killZoopsSignal.dispatch();
		}
	}
}
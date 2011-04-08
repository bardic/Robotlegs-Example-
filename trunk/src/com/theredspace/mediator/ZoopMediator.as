package com.theredspace.mediator{
	import com.theredspace.components.Zoop;
	import com.theredspace.signals.CloneZoopSignal;
	
	import flash.events.*;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ZoopMediator extends Mediator{
		[Inject]public var zoop:Zoop;
		[Inject]public var cloneZoopSignal:CloneZoopSignal
		override public function onRegister():void{
			zoop.addEventListener(MouseEvent.CLICK, onZoopClicked);
		}

		private function onZoopClicked(ev:MouseEvent):void {
			zoop.scaleDownZoop();			
			cloneZoopSignal.dispatch(zoop);
		}	
	}
}
package com.theredspace.mediator{
	import com.theredspace.components.*;
	import com.theredspace.signals.*;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ZoopLairMediator extends Mediator{
		[Inject]public var view:ZoopsLair;
		[Inject]public var addZoopToLairSignal:AddZoopToLairSignal;
		[Inject]public var addCloneToLairSignal:AddCloneToLairSignal;
		[Inject]public var startupSignal:StartUpSignal;
		override public function onRegister():void{
			addZoopToLairSignal.add(onAddZoopToLair);
			addCloneToLairSignal.add(onAddCloneToLair);
			startupSignal.dispatch();
		}
		
		private function onAddZoopToLair(zoop:Zoop):void{
			view.addCreature(zoop);
			zoop.setZoopTravelBounds(view.width,view.height);
			zoop.addEventListener(Zoop.KILL_ME_NOW, onKillZoop);
		}
		
		private function onAddCloneToLair(clone:Zoop):void{
			view.addCreature(clone);
		}
		
		private function onKillZoop(ev:Event):void{
			view.removeElement(ev.currentTarget as Zoop);
		}
	}
}
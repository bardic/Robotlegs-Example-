package com.theredspace.commands{
	import com.theredspace.components.Zoop;
	import com.theredspace.model.GameModel;
	import com.theredspace.signals.AddCloneToLairSignal;
	import com.theredspace.signals.AddZoopToLairSignal;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class CloneZoop extends SignalCommand{
		[Inject]public var model:GameModel;
		[Inject]public var zoop:Zoop;
		[Inject]public var addCloneToLiar:AddCloneToLairSignal
		override public function execute():void{
			var clone:Zoop = new Zoop(zoop.creatureIconClass,zoop.creatureType);
			clone.addCloneProps({x:zoop.x, y:zoop.y,width:zoop.width, height:zoop.height});
			model.zoopArr.push(clone);
			addCloneToLiar.dispatch(clone);
		}
	}
}
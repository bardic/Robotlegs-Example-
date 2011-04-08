package com.theredspace.commands{
	import com.theredspace.components.Zoop;
	import com.theredspace.model.GameModel;
	import com.theredspace.signals.AddZoopToLairSignal;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class AddZoop extends SignalCommand{
		[Inject]public var model:GameModel;
		[Inject]public var creatureType:int;
		[Inject]public var addZoopToLairSignal:AddZoopToLairSignal;
		override public function execute():void{
			var zoop:Zoop;
			switch(creatureType){
				case 1:
					zoop = new Zoop(model.creature1,creatureType);
				break;
				case 2:
					zoop = new Zoop(model.creature2,creatureType);
				break;
				case 3:
					zoop = new Zoop(model.creature3,creatureType);
				break;
			}
			model.zoopArr.push(zoop);
			addZoopToLairSignal.dispatch(zoop);
		}
	}
}
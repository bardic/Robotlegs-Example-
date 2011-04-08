package com.theredspace.commands{
	import com.theredspace.signals.AddZoopSignal;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class StartUp extends SignalCommand{
		[Inject]public var addZoopSignal:AddZoopSignal;
		override public function execute():void{
			addZoopSignal.dispatch(1);
			addZoopSignal.dispatch(2);
			addZoopSignal.dispatch(3);
		}
	}
}
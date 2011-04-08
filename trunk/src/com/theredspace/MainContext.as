package com.theredspace{
	import com.theredspace.commands.*;
	import com.theredspace.components.*;
	import com.theredspace.mediator.*;
	import com.theredspace.model.GameModel;
	import com.theredspace.signals.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.SignalContext;
	
	public class MainContext extends SignalContext{
		override public function startup():void{	
			injector.mapSingleton(GameModel);
			injector.mapSingleton(AddZoopToLairSignal);
			injector.mapSingleton(AddCloneToLairSignal);
			
			signalCommandMap.mapSignalClass(AddZoopSignal,AddZoop);
			signalCommandMap.mapSignalClass(KillZoopsSignal,KillZoops);
			signalCommandMap.mapSignalClass(CloneZoopSignal,CloneZoop);			
			signalCommandMap.mapSignalClass(StartUpSignal,StartUp);			
			
			mediatorMap.mapView(Zoop,ZoopMediator);
			mediatorMap.mapView(ZoopsLair,ZoopLairMediator);
			mediatorMap.mapView(AppControlBar,AppControlBarMediator);	
			mediatorMap.mapView(UberControls,UberControlsMediator);
			mediatorMap.mapView(RobotlegsPresentation,ApplicationMediator);
		}
	}
}
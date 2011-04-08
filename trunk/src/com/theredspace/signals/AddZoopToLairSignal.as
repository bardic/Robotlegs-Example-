package com.theredspace.signals{
	import com.theredspace.components.Zoop;
	
	import org.osflash.signals.Signal;
	
	public class AddZoopToLairSignal extends Signal	{
		public function AddZoopToLairSignal(){
			super(Zoop);
		}
	}
}
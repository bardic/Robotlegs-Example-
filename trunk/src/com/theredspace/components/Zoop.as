package com.theredspace.components {
	
	import com.greensock.TweenLite;
	import com.theredspace.utils.RandMovement;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	import mx.flash.UIMovieClip;
	
	public class Zoop extends UIMovieClip {
		
		public static const KILL_ME_NOW:String = "killMeNow!!!";
		
		private var _creatureIconClass:Class;
		private var _creatureType:int;
		
		//public function Zoop(boundsWidth:Number, boundsHeight:Number, creatureIconClass:Class) {
		public function Zoop($creatureIconClass:Class, $creatureType:int) {
			super();
			
			_creatureIconClass = $creatureIconClass;
			_creatureType = $creatureType;
			
			if(creatureIconClass) {
				var creatureBmp:Bitmap = new creatureIconClass();
				addChild(creatureBmp);
			}
		}
		
		public function get creatureIconClass():Class {
			return _creatureIconClass;
		}
		
		public function get creatureType():int {
			return _creatureType;
		}
		
		private function onKillTweenComplete():void {
			dispatchEvent(new Event(KILL_ME_NOW));
		}
		
		public function setZoopTravelBounds(xBounds:Number, yBounds:Number, randomPosition:Boolean=true):void {
			var rm:RandMovement = new RandMovement(this);
			if(randomPosition) { 
				this.x = rm.randRange(0, xBounds);
				this.y = rm.randRange(0, yBounds);
			}
		}
		
		public function killZoop():void {
			TweenLite.to(this, 1, {alpha:0.0, width:0, height:0, onComplete:onKillTweenComplete});
		}
		
		public function scaleDownZoop():void {
			this.width *= 0.9;
			this.height *= 0.9;
		}
		
		public function addCloneProps(data:Object):void {
			this.x = data.x;
			this.y = data.y;
			this.width = data.width;
			this.height = data.height;
			var rm:RandMovement = new RandMovement(this);
		}
	}
}
/**
 * borrowed from http://www.kirupa.com/forum/showthread.php?t=308514 :)
 * **/

package com.theredspace.utils {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.flash.UIMovieClip;
	
	public class RandMovement {
		private var char:MovieClip;
		
		//Set the range for random number changes
		private var minMove:Number = -2;
		private var maxMove:Number = 5;
		private var minTime:Number = 5000;
		private var maxTime:Number = 20000;
		
		//set the starting values for x movement, y movement, and time until next change in direction.
		private var xm:Number = randRange(minMove, maxMove);
		private var ym:Number = randRange(minMove, maxMove);
		private var nextMove:Timer = new Timer(randRange(minTime, maxTime), 1);
		
		public function randRange(min:Number, max:Number):Number {
			//return a random number from min to max
			var ret:Number = Math.floor(Math.random() * (max - min)) + min;
			
			//trace(ret);
			return ret;
		}
		
		public function RandMovement(pchar:UIMovieClip, props:Object=null) {
			for (var p:String in props) {
				try {
					this[p] = props[p]}
				catch(e:Error) {}
			}
			
			//now that all the numbers are set, set up movement and start the timer until movement rates change.
			char = pchar;
			char.addEventListener(Event.ENTER_FRAME,moveChar);
			nextMove.addEventListener(TimerEvent.TIMER_COMPLETE, randomize);
			nextMove.start();
		}
		
		public function moveChar(e:Event):void {
			var stage:DisplayObject = char.parent
			var nxm:Number = (xm < 0 ? (char.x + xm < 0 ? char.x:xm):(char.x + xm + char.width > stage.width ? stage.width - char.x - char.width : xm));
			var nym:Number = (ym < 0 ? (char.y + ym < 0 ? char.y:ym):(char.y + ym + char.height > stage.height ? stage.height - char.y - char.height : ym));
			char.x += nxm;
			char.y += nym;
			if(xm !== nxm){xm *= -1;}
			if(ym !== nym){ym *= -1;}
		}
		
		public function randomize(e:TimerEvent):void {
			//Randomize them all!
			xm = randRange(minMove,maxMove);
			ym = randRange(minMove,maxMove);
			nextMove.stop();
			
			nextMove = new Timer(randRange(minTime, maxTime),1);
			nextMove.addEventListener(TimerEvent.TIMER_COMPLETE,randomize);
			nextMove.start();
		}
	}
}
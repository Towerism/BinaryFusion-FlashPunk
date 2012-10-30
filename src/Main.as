package {
	
	import flash.ui.Mouse;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import world.WorldMain;
	
	[SWF(width = "320", height = "640")]
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Main extends Engine {
		
		public function Main() {
			super(320, 640, 60, false);
		}
		
		override public function init():void {
			FP.world = new WorldMain;
			FP.console.enable();
			FP.screen.color = 0xFFFFFF;
			input();
		}
		
		private function input():void {
			Input.define("color", Key.Z);
		}
	}	
}
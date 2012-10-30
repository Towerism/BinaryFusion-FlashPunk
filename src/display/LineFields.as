package display {
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Graphiclist;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class LineFields extends Entity {
		
		private var _back1:Backdrop;
		private var _back2:Backdrop;
		private var _back3:Backdrop;
		
		public function LineFields() {
			_back1 = new Backdrop(Asset.GFX_BACK1, false, true);
			_back2 = new Backdrop(Asset.GFX_BACK2, false, true);
			_back3 = new Backdrop(Asset.GFX_BACK3, false, true);
			
			_back1.alpha = 1;
			_back2.alpha = 1;
			_back3.alpha = 1;
			
			graphic = new Graphiclist(_back1, _back2, _back3);
			layer = GC.LAYER_BACKGROUND;
		}
		
		override public function update():void {
			_back1.y += 1000 * FP.elapsed;
			_back2.y += 1700 * FP.elapsed; 
			_back3.y += 2500 * FP.elapsed; 
			
			super.update();
		}
		
		public function get back1():Backdrop {
			return _back1;
		}
		
		public function get back2():Backdrop {
			return _back2;
		}
		
		public function get back3():Backdrop {
			return _back3;
		}
		
	}

}
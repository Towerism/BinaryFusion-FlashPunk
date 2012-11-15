package entity {
	
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class EnemyChild extends Enemy {
		
		private var parent:Enemy;
		public var follow:Boolean = true;
		
		public function EnemyChild(parent:Enemy) {
			super(parent.x, parent.y);
			
			this.parent = parent;
		}
		
		override public function update():void {
			if (follow) {
				velocity = parent.getVelocity();
			}
			
			super.update();
		}
	}
}
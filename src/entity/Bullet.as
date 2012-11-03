package entity {
	
	import net.flashpunk.FP;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Bullet extends BinaryEntity {
		
		private var velocity:EuclideanVector;
		protected var _dmg:int = 1;
		
		public function Bullet(color:int, x:Number, y:Number, velocity:EuclideanVector) {
			super(x, y);
			
			this.color = color;
			this.velocity = velocity;
			layer = GC.LAYER_BULLET;
		}
		
		override public function update():void {
			x += Math.cos(velocity.angle()) * velocity.magnitude() * FP.elapsed;
			y += Math.sin(velocity.angle()) * velocity.magnitude() * FP.elapsed;
			
			if (isOutOfBounds()) destroy();
		}
		
		public function get dmg():int {
			return _dmg;
		}
	}
}
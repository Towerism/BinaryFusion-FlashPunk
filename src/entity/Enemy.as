package entity {
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import util.enum.Reason;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Enemy extends PlayerEnemy {
		
		protected var children:Vector.<EnemyChild> = new Vector.<EnemyChild>;
		
		protected var velocity:EuclideanVector = new EuclideanVector;
		protected var deltaAngle:Number = 0;
		private var checkOutOfBounds:Boolean = false;
		
		public function Enemy(x:Number, y:Number) {
			FP.alarm(5, setBoundsCheck);
			type = GC.TYPE_ENEMY;
			color = FP.rand(2);
			
			super(x, y);
		}
		
		override public function update():void {
			x += Math.cos(velocity.angle()) * velocity.magnitude() * FP.elapsed;
			y += Math.sin(velocity.angle()) * velocity.magnitude() * FP.elapsed;
			if (checkOutOfBounds && isOutOfBounds()) destroyReason(Reason.Bounds);
			
			if (graphic != null) Image(graphic).angle += deltaAngle * FP.elapsed;
			collisions();
			
			super.update();
		}
		
		private function collisions():void {
			var b:Bullet = collide(GC.TYPE_PROJECTILE_PLAYER, x, y) as Bullet;
			if (b) hit(b);
		}
		
		protected function hit(b:Bullet):void {
			if (b.color != color) destroy();
			b.destroy();
		}
		
		protected function addChild():EnemyChild {
			children[children.length] = world.add(new EnemyChild(this) as Entity) as EnemyChild;
			return children[children.length - 1];
		}
		
		public function getVelocity():EuclideanVector {
			return velocity;
		}
		
		private function setBoundsCheck():void { checkOutOfBounds = true; }
	}
}
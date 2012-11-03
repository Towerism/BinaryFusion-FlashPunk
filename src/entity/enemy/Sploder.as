package entity.enemy {

	import entity.bullet.BulletEnemy;
	import entity.Enemy;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Tween;
	import net.flashpunk.utils.Ease;
	import util.enum.Reason;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Sploder extends Enemy {
		
		public function Sploder(x:Number, y:Number) {
			super(x, y);
			
			sprite = new Spritemap(Asset.GFX_ENEMY_SPLODER, 34, 34);
			setHitbox(28, 28, 14, 14);
			deltaAngle = 360;
			FP.tween(this, { y:100 }, 1.5, { ease:Ease.quadOut, complete:onMoveTween } );
		}
		
		override protected function onExplode():void {
			var divider:int = 10;
			var numBullets:int = 360 / divider;
			for (var i:int = 0; i < numBullets; i++) {
				world.add(new BulletEnemy(color, x, y, new EuclideanVector(150, i * divider)));
			}
		}
		
		private function onMoveTween():void {
			if (active) FP.alarm(1, onMoveAlarm);
		}
		
		private function onMoveAlarm():void {
			destroyReason(Reason.Explode);
		}
	}
}
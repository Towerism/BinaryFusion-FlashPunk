package entity.bullet {
	import entity.Bullet;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class BulletEnemy extends Bullet {
		
		public function BulletEnemy(color:int, x:Number, y:Number, velocity:EuclideanVector) {
			super(color, x, y, velocity);
			
			sprite = new Spritemap(Asset.GFX_ENEMY_BULLET, 10, 10);
			setHitbox(10, 10, 5, 5);
			type = GC.TYPE_PROJECTILE_ENEMY;		
		}		
	}
}
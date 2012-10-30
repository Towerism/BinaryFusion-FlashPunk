package entity.enemy {
	
	import entity.Bullet;
	import entity.Enemy;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Pinrose extends Enemy {
		
		public function Pinrose(x:Number, y:Number) {
			super(x, y);
			
			sprite = new Spritemap(Asset.GFX_ENEMY_PINROSE, 34, 34);
			setHitbox(26, 26, 13, 13);
			deltaAngle = 180;
			velocity = new EuclideanVector(50, 270);
		}
	}
}
package entity.bullet {
	
	import entity.Bullet;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class BulletPlayer extends Bullet {
		
		public function BulletPlayer(color:int, x:Number, y:Number, velocity:EuclideanVector) {
			super(color, x, y, velocity);
			
			sprite = new Spritemap(Asset.GFX_PLAYER_BULLET, 6, 15);
			setHitbox(Image(graphic).width, Image(graphic).height, Image(graphic).width / 2, Image(graphic).height / 2 + 1);
			type = GC.TYPE_PROJECTILE_PLAYER;
		}		
	}

}
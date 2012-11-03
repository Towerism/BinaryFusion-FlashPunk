package entity {
	
	import entity.bullet.BulletPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Player extends PlayerEnemy {
		
		private var speed:Number = 400;	
		private var shoot_delay:Number = 0.15;
		private var shoot_timer:Number = 0;
		
		public function Player(x:Number, y:Number) {
			super(x, y);
			
			sprite = new Spritemap(Asset.GFX_PLAYER, 48, 31);
			mask = new Pixelmask(Asset.MASK_PLAYER, -Image(graphic).width / 2, -Image(graphic).height / 2 - 1);
			type = GC.TYPE_PLAYER;
		}
		
		override public function update():void {
			followMouse();
			FP.clampInRect(this, halfWidth, halfHeight, FP.width - width, FP.height - height, -12);			
			handleInput();
			
			collisions();
			
			super.update();
		}
		
		private function handleInput():void {
			if (Input.pressed("color")) color = (color == GC.WHITE) ? GC.BLACK : GC.WHITE;
			if (Input.mouseDown) handleShoot(); else shoot_timer = shoot_delay;
		}
		
		private function handleShoot():void {
			shoot_timer += FP.elapsed;
			if (shoot_timer >= shoot_delay) {
				world.add(new BulletPlayer(color, x, y, new EuclideanVector(500, 90)) as Entity);
				shoot_timer = 0;
			}
		}
		
		private function collisions():void {
			var b:Bullet = collide(GC.TYPE_PROJECTILE_ENEMY, x, y) as Bullet;
			if (b) {
				if (b.color != color) damage(b);
				b.destroy();
			}
		}
		
		private function followMouse():void {
			if (FP.distance(x, y, Input.mouseX, Input.mouseY) > speed * FP.elapsed) {
				var angle:Number = FP.angle(x, y, Input.mouseX, Input.mouseY) * FP.RAD;
				x += speed * Math.cos(angle) * FP.elapsed;
				y += speed * Math.sin(angle) * FP.elapsed;
			} else {
				x = Input.mouseX;
				y = Input.mouseY;
			}
		}
	}
}
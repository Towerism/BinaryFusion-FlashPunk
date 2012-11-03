package entity.enemy {
	import entity.Enemy;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import util.EuclideanVector;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Twoface extends Enemy {
		
		public function Twoface(x:Number, y:Number) {
			super(x, y);
			
			velocity = new EuclideanVector(30, 270);
		}
		
		override public function added():void {
			var image:Vector.<Image> = new Vector.<Image>;
			for (var i:int = 0; i < 2; i++) {
				children[i] = addChild();
				children[i].sprite = new Spritemap(Asset.GFX_ENEMY_TWOFACE, 32, 37);
				image[i] = Image(children[i].graphic);
				if (i == 1) image[i].flipped = true;
			}
			
			children[0].mask = new Pixelmask(Asset.MASK_TWOFACE_LEFT, -32, -19)
			children[0].color = FP.rand(2);
			image[0].originX = 32;
			
			children[1].mask = new Pixelmask(Asset.MASK_TWOFACE_RIGHT, 0, -19);
			children[1].color = int(!children[0].color);
			image[1].originX = 0;
			
			super.added();
		}
		
		override public function update():void {
			trace(x, y);
			
			super.update();
		}
	}
}
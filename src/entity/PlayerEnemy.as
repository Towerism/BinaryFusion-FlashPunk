package entity {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class PlayerEnemy extends BinaryEntity {
		
		public function PlayerEnemy(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			super(x, y, graphic, mask);
			layer = GC.LAYER_PLAYER_ENEMY
		}		
	}
}
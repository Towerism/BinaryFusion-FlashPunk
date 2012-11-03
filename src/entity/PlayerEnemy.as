package entity {
	
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import util.enum.Reason;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class PlayerEnemy extends BinaryEntity {
		
		private var _hp:int = 1;
		
		public function PlayerEnemy(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			super(x, y, graphic, mask);
			layer = GC.LAYER_PLAYER_ENEMY
		}
		
		public function damage(b:Bullet):void {
			hp -= b.dmg;
		}
		
		public function get hp():int {
			return _hp;
		}
		
		public function set hp(value:int):void {
			_hp = value;
			if (_hp <= 0) destroyReason(Reason.Death)
		}
	}
}
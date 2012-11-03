package entity {

	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import util.enum.Reason;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class BinaryEntity extends Entity {
		
		private var _sprite:Spritemap;
		private var _color:int;
		
		public function BinaryEntity(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			super(x, y, graphic, mask);
		}
		
		public function destroy():void {
			this.world.remove(this);
		}
		
		protected function destroyReason(reason:Reason):void {
			switch (reason) {
				case Reason.Bounds:
					onOutOfBounds();
					destroy();
					break;
				case Reason.Death:
					onDeath();
					destroy();
					break;
				case Reason.Explode:
					onExplode();
					destroy();
					break;
			}
		}
		
		protected function isOutOfBounds():Boolean {
			return (x < -halfWidth || y < -halfHeight || x > FP.width + halfWidth || y > FP.height + halfHeight);
		}
		
		public function get color():int {
			if (_sprite != null)
				return _sprite.frame;
			return 0;
		}
		
		public function set color(value:int):void {
			var v:int = (value != 0) ? 1 : 0;
			if (_sprite != null) _sprite.frame = v;
			_color = v;
		}
		
		public function get sprite():Spritemap {
			return _sprite;
		}
		
		public function set sprite(value:Spritemap):void {
			_sprite = value;
			graphic = sprite;
			Image(graphic).centerOO();
			_sprite.frame = _color;
		}
		
		protected function onOutOfBounds():void { }
		protected function onDeath():void { }
		protected function onExplode():void { }
	}
}
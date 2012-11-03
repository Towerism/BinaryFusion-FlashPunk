package world {
	
	import display.LineFields;
	import entity.enemy.Pinrose;
	import entity.enemy.Sploder;
	import entity.enemy.Twoface;
	import entity.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class WorldMain extends World {
		
		public function WorldMain() {
			add(new LineFields);
			
			var player:Entity = new Player(160, 450) as Entity;
			add(player);
			
			add(new Twoface(160, -50));
		}
		
		override public function update():void {
			
			super.update();
		}
	}
}
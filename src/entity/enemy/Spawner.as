package entity.enemy {
	
	import entity.Enemy;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Spawner extends Entity {
		
		private var timer:Number = 0;
		private var targetTime:Number = 0;
		private var enemy:Class = Pinrose;
		private var interval:Point = new Point(1, 3);
		
		public function Spawner() {
			setTargetTime();
		}
		
		override public function update():void {
			spawn();
			
			super.update();
		}
		
		private function spawn():void {
			timer += FP.elapsed;
			if (timer >= targetTime) {
				world.add(new enemy(FP.clamp(FP.rand(FP.width), 20, FP.width - 20), -50) as Entity);
				timer -= targetTime;
				setEnemy();
				setTargetTime();
			}
		}
		
		private function setEnemy():void {
			var randEnemy:uint = FP.rand(11);
			
			if (randEnemy < 2) enemy = Sploder;
			else if (randEnemy < 5) enemy = Twoface;
			else enemy = Pinrose;
		}
		
		private function setTargetTime():void {
			targetTime = FP.rand(interval.y - interval.x + 1) + interval.x;
		}
	}
}
package {
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GC {
		
		public static const WHITE:int = 0;
		public static const BLACK:int = 1;
		
		public static const TYPE_PLAYER:String = "player";
		public static const TYPE_ENEMY:String = "enemy";
		public static const TYPE_PROJECTILE_PLAYER:String = "projectile-player";
		public static const TYPE_PROJECTILE_ENEMY:String = "projectile-enemy";
		
		private static var layer_count:int = -1 ;
		public static const LAYER_PLAYER_ENEMY:int = layer_count++;
		public static const LAYER_BULLET:int = layer_count++;
		public static const LAYER_BACKGROUND:int = layer_count++;
	}
}
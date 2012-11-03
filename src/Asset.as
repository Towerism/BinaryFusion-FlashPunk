package  {
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Asset {
		[Embed(source = "../assets/player/ship.png")] public static const GFX_PLAYER:Class;
		
		[Embed(source="../assets/projectile/player/bullet.png")] public static const GFX_PLAYER_BULLET:Class;
		[Embed(source = "../assets/projectile/enemy/bullet.png")] public static const GFX_ENEMY_BULLET:Class;
		
		[Embed(source = "../assets/enemy/PinRose.png")] public static const GFX_ENEMY_PINROSE:Class;
		[Embed(source = "../assets/enemy/Sploder.png")] public static const GFX_ENEMY_SPLODER:Class;
		[Embed(source = "../assets/enemy/TwoFace.png")] public static const GFX_ENEMY_TWOFACE:Class;
		
		[Embed(source = "../assets/level/background1.png")] public static const GFX_BACK1:Class;
		[Embed(source = "../assets/level/background2.png")] public static const GFX_BACK2:Class;
		[Embed(source = "../assets/level/background3.png")] public static const GFX_BACK3:Class;
		
		[Embed(source = "../assets/player/pixelmask.png")] public static const MASK_PLAYER:Class;
		[Embed(source = "../assets/enemy/masks/TwoFace-left.png")] public static const MASK_TWOFACE_LEFT:Class;
		[Embed(source = "../assets/enemy/masks/TwoFace-right.png")] public static const MASK_TWOFACE_RIGHT:Class;
	}
}
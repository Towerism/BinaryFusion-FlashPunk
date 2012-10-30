package util.enum {
	
	import util.Enum;
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Reason extends Enum {		
		{initEnum(Reason);}
		
		public static const Bounds:Reason = new Reason();
		public static const Death:Reason = new Reason();
		public static const Explode:Reason = new Reason();
	}
}
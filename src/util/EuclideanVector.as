package util {
	
	import flash.geom.Point;
	
	public class EuclideanVector {
		private var _position:Point = new Point;
		
		public function EuclideanVector(magnitude:Number = 0, angle:Number = 0) {
			_position.x = Math.cos(-angle * Math.PI / 180) * magnitude;
			_position.y = Math.sin(-angle * Math.PI / 180) * magnitude;
		}
		
		public function inverse():EuclideanVector {
			return new EuclideanVector(magnitude(), -angle());
		}
		
		public function sum(otherVector:EuclideanVector):EuclideanVector {
			_position.x += otherVector._position.x;
			_position.y += otherVector._position.y;
			
			return this;
		}
		
		public function subtract(otherVector:EuclideanVector):EuclideanVector {
			_position.x -= otherVector._position.x;
			_position.y -= otherVector._position.y;
			
			return this;
		}
		
		public function multiply(number:Number):EuclideanVector {
			_position.x *= number;
			_position.y *= number;
			
			return this;
		}
		
		public function magnitude():Number {
			return Math.sqrt((_position.x * _position.x) + (_position.y * _position.y));
		}
		
		public function angle():Number {
			var angle:Number = Math.atan2(_position.y, _position.x);
			
			while (angle < 0) {
				angle += Math.PI * 2;
			}
			
			return angle;
		}
		
		public function dot(otherVector:EuclideanVector):Number {
			return (_position.x * otherVector._position.x) + (_position.y * otherVector._position.y);
		}
		
		public function angleBetween(otherVector:EuclideanVector):Number {
			return Math.acos(dot(otherVector) / (magnitude() * otherVector.magnitude()));
		}
		
		public function rangedAngleBetween(otherVector:EuclideanVector):Number {
			var firstAngle:Number;
			var secondAngle:Number;
			
			var angle:Number;
			
			firstAngle = Math.atan2(otherVector._position.y, otherVector._position.x);
			secondAngle = Math.atan2(_position.y, _position.x);
			
			angle = secondAngle - firstAngle;
			
			while (angle > Math.PI)
				angle -= Math.PI * 2;
			while (angle < -Math.PI)
				angle += Math.PI * 2;
			
			return angle;
		}
		
		public function normalize():EuclideanVector {
			_position.x /= magnitude();
			_position.y /= magnitude();
			
			return this;
		}
		
		public function normalRight():EuclideanVector {
			var mag:Number = Math.sqrt(( -_position.y * -_position.y) + (_position.x * _position.x));
			var ang:Number = Math.atan2(_position.x, -_position.y);
			return new EuclideanVector(mag, ang);
		}
		
		public function normalLeft():EuclideanVector {
			var mag:Number = Math.sqrt((_position.y * _position.y) + (-_position.x * -_position.x));
			var ang:Number = Math.atan2(-_position.x, _position.y);
			return new EuclideanVector(mag, ang);
		}
		
		public function rotate(angleInRadians:Number):EuclideanVector {
			var newPosX:Number = (_position.x * Math.cos(angleInRadians)) - (_position.y * Math.sin(angleInRadians));
			var newPosY:Number = (_position.x * Math.sin(angleInRadians)) + (_position.y * Math.cos(angleInRadians));
			
			_position.x = newPosX;
			_position.y = newPosY;
			
			return this;
		}
		
		public function get position():Point {
			return _position;
		}
		
		public function set position(value:Point):void {
			_position = value;
		}
	}
}
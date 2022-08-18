package math;

class Math {
    public function new() {}
    
    public static inline final PI: Float = 3.14159;

    public static inline function square(x: Float): Float {
        return x * x;
    }

    public static inline function cube(x: Float): Float {
        return x * x * x;
    }
}
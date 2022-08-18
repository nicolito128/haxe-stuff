import haxe.macro.Expr;

class Main {
    static public function main() {
        trace(Macro.addMacro(10, 5));
        trace(Macro.addCommon(2, 7));
    }
}

class Macro {
    macro static public function addMacro(e: ExprOf<Int>, i: ExprOf<Int>) {
        return macro $e + $i;
    }

    static public function addCommon(e: Int, i: Int) {
        return e + i;
    }
}
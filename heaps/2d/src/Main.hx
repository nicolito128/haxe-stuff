class Main {
    static public function main() {
        new App();
    }
}

class App extends hxd.App {
    public function new() {
        super();

    }

    override function init() {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), this.s2d);
        tf.text = "Hello, Heaps World!";
        
        var grap = new h2d.Graphics(this.s2d);
        grap.beginFill(0xFF6A6A);
        grap.drawRect(20, 50, 100, 100);
        grap.endFill();
    }
}

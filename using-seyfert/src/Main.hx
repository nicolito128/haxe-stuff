import js.Promise;

@:jsRequire('seyfert', 'Client')
extern class Client {
    function new();

    extern public function start(): Promise<Void>;
}

class Main {
    static public function main(): Void {
        var c = new Client();
        Sys.println("Starting a Seyfert client with a layer of Haxe!");
        c.start();
    }
}
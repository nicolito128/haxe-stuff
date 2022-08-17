class Main {
    static public function main(): Void {
        var dog0 = new Dog("Fido");
        var bird0 = new Bird("Tweety");
        var fish0 = new Fish("Nemo");

        dog0.makeSound();
        bird0.makeSound();
        fish0.makeSound();
    }
}

abstract class Animal {
    var type: String;
    var name: String;
    var sound: String;

    public function makeSound(): Void {
        trace(this.name + " says " + this.sound);
    }

    public function getType(): String {
        return this.type;
    }
}

class Dog extends Animal {
    public function new(name: String) {
        this.type = "Dog";
        this.name = name;
        this.sound = "Woof!";
    }
}

class Bird extends Animal {
    public function new(name: String) {
        this.type = "Bird";
        this.name = name;
        this.sound = "Chirp!";
    }
}

class Fish extends Animal {
    public function new(name: String) {
        this.type = "Fish";
        this.name = name;
        this.sound = "Blub!";
    }
}
interface Greeter {
    public function greet(): String;
}

class Main {
    static public function main(): Void {
        var person0 = new Person("John", 20);
        var person1 = new Employee("Lewis", 45, "PHP Developer", 1000);

        trace(person0.greet());
        trace(person1.greet());

        trace(person1.getName() + "'s salary is USD$" + person1.getSalary());
        
        trace(person0.toString());
        trace(person1.toString());
    }
}

class Person implements Greeter {
    var name: String;
    var age: Int;

    public function new(name: String, age: Int) {
        this.name = name;
        this.age = age;
    }

    public function getName(): String {
        return this.name;
    }

    public function getAge(): Int {
        return this.age;
    }

    public function greet(): String {
        return "Hello, I'm " + this.name;
    }

    public function toString(): String {
        return "Person[name=" + this.name + ",age=" + this.age + "]";
    }
}

class Employee extends Person {
    var job: String;
    var salary: Float;

    public function new(name: String, age: Int, job: String, salary: Float) {
        super(name, age);
        this.job = job;
        this.salary = salary;
    }

    public function getJob(): String {
        return this.job;
    }

    public function getSalary(): Float {
        return this.salary;
    }

    override public function toString(): String {
        return "Employee[name=" + this.name + ",age=" + this.age + ",job=" + this.job + "]";
    }
}
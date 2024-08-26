void main()
{
    final platypus = Platypus(50.0);
    final robin = Robin();
    platypus.layEggs();
    robin.layEggs();

    // Challenge 01
    final calculator = Calculator();
    print(calculator.sum(5 , 10));
    print(calculator.subtract(25 , 12));
    print(calculator.multiply(5 , 5));
    print(calculator.subtract(22 , 11));

    // Challenge 02
    List <Platypus> listOfPlatypus = [Platypus(55) , Platypus(24) , Platypus(63) , Platypus(74) , Platypus(11)];
    listOfPlatypus.sort();
    print(listOfPlatypus);
}

mixin EggLayer
{
    void layEggs()
    {
        print("Plop plop");
    }
}

mixin Flyer
{
    void fly()
    {
        print("Swoosh swoosh");
    }
}

abstract class Animal
{
    void eat();
    void move();
}

class Platypus extends Animal with EggLayer implements Comparable <Platypus>
{
    Platypus(this.weight);

    final double weight;

    @override
    void eat()
    {
        print("Munch munch");
    }

    @override
    void move()
    {
        print("Glide glide");
    }
    
    @override
    int compareTo(Platypus platypus) => weight.compareTo(platypus.weight);

    @override
    String toString() => "Weight: $weight";
}

abstract class Bird
{
    void fly();
    void layEggs();
}

class Robin extends Bird with EggLayer , Flyer {}

class MaleBolbol extends Bird
{
    void sing()
    {
        print("El-bolbol");
    }

    @override
    void fly()
    {
        print("Trr Trr");
    }

    @override
    void layEggs()
    {
        print("He7 He7");
    }
}

mixin Adder
{
    double sum(double firstNumber , double secondNumber) => firstNumber + secondNumber;
}

mixin Subtractor
{
    double subtract(double firstNumber , double secondNumber) => firstNumber - secondNumber;
}

mixin Divider
{
    double divide(double firstNumber , double secondNumber) => firstNumber / secondNumber;
}

mixin Multiplyer
{
    double multiply(double firstNumber , double secondNumber) => firstNumber * secondNumber;
}

class Calculator with Adder , Subtractor , Divider , Multiplyer {}
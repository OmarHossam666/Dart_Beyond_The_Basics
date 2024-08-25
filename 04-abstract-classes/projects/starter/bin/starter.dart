void main()
{
    // Abstract classes can't be instantiated.
    // final animal = Animal();

    Animal platypus = Platypus();
    print(platypus.isAlive);

    platypus.eat();
    platypus.move();
    // platypus.layEggs();

    print(platypus);

    // Challenge 01
    final localStorage = LocalStorage();
    localStorage.save();
    localStorage.retrieve();

    final cloudStorage = CloudStorage();
    cloudStorage.save();
    cloudStorage.retrieve();
}

abstract class Animal
{
    bool isAlive = true;
    void eat();
    void move();

    @override
    String toString() => "I'm a $runtimeType";
}

class Platypus extends Animal
{
    void layEggs()
    {
        print("Plop Plop!");
    }

    @override
    void eat()
    {
        print("Munch Munch!");
    }

    @override
    void move()
    {
        print("Glide Glide!");
    }
}

abstract class Storage
{
    void save() => print("Saving in $runtimeType....");
    void retrieve() => print("Retrieving From $runtimeType....");
}

class LocalStorage extends Storage
{

}

class CloudStorage extends Storage
{

}
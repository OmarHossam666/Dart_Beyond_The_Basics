enum Grade {A , B , C , D , F}
enum Role {Athlete , BandMember , StudentUnion}

void main()
{
    // Challenge 01
    final fruit = Fruit("red");
    fruit.describeColor();

    final melon = Melon("blue");
    melon.describeColor();

    final watermelon = Watermelon("green");
    watermelon.describeColor();

    final cantaloupe = Cantaloupe("yellow");
    cantaloupe.describeColor();

    // Challenge 02
    final omarHossam = Student("Omar Hossam" , [Role.Athlete , Role.BandMember]);
    omarHossam.printRules();

    final malekHossam = Student("Malek Hossam" , [Role.Athlete]);
    malekHossam.printRules();

    final nourOsama = Student("Nour Osama" , []);
    nourOsama.printRules();
}

class Fruit
{
    Fruit(this.color);

    String color;

    void describeColor() => print("The color of the fruit is $color");
}

class Melon extends Fruit
{
    Melon(super.color);
}

class Watermelon extends Melon
{
    Watermelon(super.color);

    @override
    void describeColor() => print("The color of the watermelon is $color");
}

class Cantaloupe extends Melon
{
    Cantaloupe(super.color);
}

class Person
{
    Person(this.name);

    String name;
}

class Student extends Person
{
    Student(super.name , this.roles);

    List <Role> roles;

    void printRules()
    {
        print("Roles of student: $name");
        for (final role in roles)
        {
            print(role.name);
        }
    }
}
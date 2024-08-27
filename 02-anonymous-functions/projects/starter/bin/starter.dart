import 'dart:math';

typedef MapBuilder = Map <String , int> Function(List <int>);
typedef ZipCode = int;
typedef TouchHandler = void Function(double x , double y);
void main()
{
    multiply(int firstNumber , int secondNumber)
    {
        return firstNumber * secondNumber;
    }

    // Function divide = (int firstNumber , int secondNumber)
    // {
    //     if (secondNumber == 0) return Null;
    //     return firstNumber / secondNumber;
    // };

    print(multiply.call(5 , 5));
    // print(divide.call(10 , 5));

    namedFunction().call();

    List <int> myList = [1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10];

    List <int> tripledList = [];
    triple(int number)
    {
        number *= 3;
        tripledList.add(number);
    }
    myList.forEach(triple);

    print(myList);
    print(tripledList);

    final flowerColor = {"Roses": "Red" , "Violets": "Blue"};
    printFlowerColors(String flower , String color)
    {
        print("$flower are $color");
    }
    flowerColor.forEach(printFlowerColors);

    print('I \u2764 Dart');
    print('and so do you');

    const numbers = [0 , 2 , 4 , 6 , 8 , 10];
    final squaredNumbers = numbers.map((number) => number * number);
    print(squaredNumbers.toList());

    const students = {"Omar": "A+" , "Nour": "A"};
    final maleStudents = students.keys.where((student) => student != "Nour");
    print(maleStudents.toList());

    const listOfNumbers = [1 , 2 , 3 , 4 , 5 , 6];
    final evenNumbers = listOfNumbers.where((number) => number.isEven);
    print(evenNumbers.toList());

    final sum = listOfNumbers.reduce((sum , element) => sum + element);
    final divide = listOfNumbers.reduce((divide , element) => divide ~/ element);
    final multiplication = listOfNumbers.reduce((multiply , element) => multiply * element);
    final subtraction = listOfNumbers.reduce((sub , element) => sub - element);
    final sumOfSquares = listOfNumbers.reduce((squares , element) => squares + element * element);

    print("Sum: $sum");
    print("Divide: $divide");
    print("Subtraction: $subtraction");
    print("Multiplication: $multiplication");
    print("Sum Of Squares: $sumOfSquares");

    const evens = [2 , 4 , 6 , 8 , 10];
    final total = evens.fold <int> (0 , (sum , element)
    {
        print("Sum: $sum Element: $element");
        return sum + element;
    });

    print(total);

    final emptyList = <int> [];
    final anotherSum = emptyList.fold <int> (0 , (sum , element)
    {
        return sum + element;
    });

    print(anotherSum);

    final desserts = ['cookies' , 'pie' , 'donuts' , 'brownies'];
    desserts.sort((firstElement , secondElement) => firstElement.length.compareTo(secondElement.length));
    print(desserts);

    final bigTallDesserts = desserts.where((dessert) => dessert.length > 5).map((dessert) => dessert.toUpperCase()).toList(); // Declerative Programming

    print(bigTallDesserts);

    // Imperative Programming
    final modifiedDesserts = <String> [];
    for (final dessert in desserts)
    {
        if (dessert.length > 5)
        {
            modifiedDesserts.add(dessert.toUpperCase());
        }
    }
    print(modifiedDesserts);

    // Exercise
    final scores = [89, 77, 46, 93, 82, 67, 32, 88];
    scores.sort((firstScore , secondScore) => secondScore.compareTo(firstScore));
    print(scores);

    final BGrades = scores.where((score) => score > 80 && score < 90);
    print(BGrades);

    // final myButton = Button(title: "Click Me!" , onPressed: () => print("Clicked!"));
    // print(myButton.onPressed); // The function itself
    // myButton.onPressed(); // The call of the function
    // myButton.onPressed.call(); // The call of the function

    final anotherButton = Button(title: "Click Me Too!" , onPressed: () => print("I am the another button!"));
    print(anotherButton.onPressed);
    anotherButton.onPressed();
    anotherButton.onPressed.call();

    final myWidget = Widget(onTouch: (xPosition) => print(xPosition));
    myWidget.onTouch(3.14);

    final anotherWidget = AnotherWidget(timeStamp: () => DateTime.now().toIso8601String());
    print(anotherWidget.timeStamp);
    print(anotherWidget.timeStamp!());
    print(anotherWidget.timeStamp?.call());

    final myStateManager = StateManager();

    final myButton = Button(title: "Click Me!" , onPressed: myStateManager.handleButtonClick);

    print(myStateManager._counter); // 0

    myButton.onPressed();
    print(myStateManager._counter); // 1

    myButton.onPressed();
    print(myStateManager._counter); // 2

    const cities = ['Istanbul' , 'Ankara' , 'Izmir' , 'Bursa' , 'Antalya'];
    // cities.forEach((city) => print(city)); // Because the anonymous function has the same property like the print method you can use the tear-off instead.
    cities.forEach(print); // This the Tear-Off.

    // ZipCode number = 66;
    // int anotherNumber = 42;

    // print(number is int); // true
    // print(anotherNumber is ZipCode); // true

    final mySurface = Surface(onTouch: (x , y) => print("X-axis: $x | Y-axis: $y"));
    mySurface.touch(202.3 , 134.0);
    mySurface.onTouch;

    var counter = 0;
    incrementCounter()
    {
        counter++;
        print(counter);
    }

    incrementCounter();
    incrementCounter();
    incrementCounter();
    incrementCounter();
    incrementCounter();

    final counter1 = countingFunction();
    final counter2 = countingFunction();

    print(counter1()); // 1
    print(counter2()); // 1
    print(counter2()); // 2
    print(counter1()); // 2

    // Challenge 01
    final animals = {'sheep': 99 , 'goats': 32 , 'snakes': 7 , 'lions': 80 , 'seals': 18};
    int totalNumber = 0;
    animals.forEach((animal , numberOfAnimal)
    {
        if (animal[0] == 's' || animal[0] == "S")
        {
            totalNumber += numberOfAnimal;
        }
    });
    print(totalNumber); // 124

    // Challenge 02
    final repeatedTask = repeatTask(4 , 2 , (num input) => pow(input , 2));
    print(repeatedTask);
}

Function namedFunction()
{
    return () => print("I am anonymous function!");
}

class Button
{
    Button({required this.title , required this.onPressed});

    final String title;
    final void Function() onPressed;
}

class Widget
{
    Widget({required this.onTouch});

    final void Function(double xPosition) onTouch;
}

class AnotherWidget
{
    AnotherWidget({this.timeStamp});

    final String Function() ? timeStamp; // The null for making it optional.
}

class StateManager
{
    int _counter = 0;

    void handleButtonClick()
    {
        _counter++;
    }
}

class Gizmo
{
    Gizmo({required this.builder});

    final MapBuilder builder;
}

// Exercise
class Surface
{
    Surface({required this.onTouch});

    final TouchHandler onTouch;

    void touch(double x , double y)
    {
        onTouch(x , y);
    }
}

Function countingFunction()
{
    var counter = 0;
    incrementCounter()
    {
        counter++;
        return counter;
    }
    return incrementCounter;
}

// Challenge 02
int repeatTask(int times , int input , Function task)
{
    int result = task(input); // Called once
    for (int i = 1 ; i < times ; i++) // Started from 1 because i already called it once before i enter the loop
    {
        result = task(result); 
    }
    return result;
}
void main()
{
    Function multiply = (int firstNumber , int secondNumber)
    {
        return firstNumber * secondNumber;
    };

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
    final triple = (int number)
    {
        number *= 3;
        tripledList.add(number);
    };
    myList.forEach(triple);

    print(myList);
    print(tripledList);

    final flowerColor = {"Roses": "Red" , "Violets": "Blue"};
    final printFlowerColors = (String flower , String color)
    {
        print("$flower are $color");
    };
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
}

Function namedFunction()
{
    return () => print("I am anonymous function!");
}

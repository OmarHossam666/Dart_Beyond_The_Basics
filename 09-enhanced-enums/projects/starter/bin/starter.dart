void main()
{
    final color = TrafficLight.green;
    print(color.message);

    final pointA = Point(2 , 3);
    print(pointA);

    final pointB = Point(4 , 1);
    print(pointB);

    final pointC = pointA + pointB;
    print(pointC);

    Day day = Day.saturday;

    day += 12;
    print(day.name); // thursday

    print(day.next.name); // friday

    final anotherDay = Day.saturday;

    print(anotherDay.previous); // friday

    final restDay = Day.friday;
    final serialized = restDay.serialize();
    final deserialized = Day.deserialize(serialized);

    print(serialized);
    print(deserialized);

    final weather = Weather.rainy;
    final weatherSerialized = weather.serialize();
    final weatherDeserialized = Weather.deserialize(weatherSerialized);

    print(weatherSerialized);
    print(weatherDeserialized);

    final fruit = Fruit.banana;
    fruit.describe();

    final vegetable = Vegetable.broccoli;
    vegetable.describe();

    final defaultFont = Default.font.value;
    print(defaultFont);

    final defaultSize = Default.size.value;
    print(defaultSize);

    final defaultWeight = Default.weight.value;
    print(defaultWeight);

    // Challenge 01
    var myDay = Day.saturday;

    print(--myDay); // friday

    myDay.displayName();

    // Challenge 02
    final response = HTTP.badRequest;
    print(response.code);
}

enum TrafficLight
{
    green('Go!') , yellow('Slow down!') , red('Stop!');

    const TrafficLight(this.message);

    final String message;
}

class Point
{
    const Point(this.x , this.y);

    final double x;
    final double y;

    Point operator +(Point other)
    {
        return Point(x + other.x , y + other.y);
    }

    @override
    String toString() => '($x , $y)';
}

abstract class Serializable
{
    String serialize();
}

enum Day implements Serializable
{
    saturday,
    sunday,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday;

    Day operator +(int days)
    {
        final numberOfItems = Day.values.length; // 7
        final index = (this.index + days) % numberOfItems;

        return Day.values[index];
    }

    Day operator -(int days)
    {
        final numberOfItems = Day.values.length;
        final index = (this.index - days) % numberOfItems;

        return Day.values[index];
    }

    Day get next => this + 1;

    Day get previous => this - 1;

    void displayName() => print('${name[0].toUpperCase()}${name.substring(1).toLowerCase()}');

    static Day deserialize(String value)
    {
        return Day.values.firstWhere((day) => day.name == value , orElse: () => Day.friday);
    }

    @override
    String serialize() => name;
}

enum Weather implements Serializable
{
    sunny , cloudy , rainy;
    
    
    static Weather deserialize(String value)
    {
        return Weather.values.firstWhere((weather) => weather.name == value , orElse: () => Weather.sunny);
    }

    @override
    String serialize() => name;
}

enum Fruit with Describer
{
    cherry , peach , banana
}

enum Vegetable with Describer
{
    carrot , broccoli , spinach
}

mixin Describer on Enum
{
    void describe() => print('This $runtimeType is a $name');
}

enum Default <T extends Object>
{
    font <String> ('roboto'),
    size <double> (14.0),
    weight <int> (400);

    const Default(this.value);

    final T value;
}

enum HTTP
{   
    badRequest(400),
    notFound(404),
    gone(410);

    const HTTP(this.code);

    final int code;
}
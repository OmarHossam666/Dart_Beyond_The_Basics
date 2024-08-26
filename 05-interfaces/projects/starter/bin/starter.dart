enum Gender {male , female , gamal , preferNotToSay}

void main()
{
    final DataRepository firstRepository = FakeWebServer();
    final firstTemperature = firstRepository.fetchTemperature("El-sinbilawin");
    print(firstTemperature);

    final secondRepository = DataRepository();
    final secondTemperature = secondRepository.fetchTemperature("El-horany");
    print(secondTemperature);

    final thirdRepository = DataRepository();
    final thirdTemperature = thirdRepository.fetchTemperature("Shinfas");
    print(thirdTemperature);

    final myClass = SomeClass();
    print(myClass.myField); // 42
    myClass.myMethod(); // 42

    final anotherClass = MyClass();
    print(anotherClass.myField); // 66
    anotherClass.myMethod(); // My name is omar!

    // Challenge 01
    final Bottle myBottle = SodaBottle();
    myBottle.open();

    // Challenge 02
    final NoteRepository noteRepository = FakeDatabase(["Note1" , "Note2"]);
    print(noteRepository.fetchNumberOfNotes());
    noteRepository.fetchNoteDescription("Note");
    noteRepository.fetchNoteMaker("Note");
    noteRepository.isUsed("Note");
}

abstract class DataRepository
{
    factory DataRepository() => FakeWebServer();

    double? fetchTemperature(String city);
}

class FakeWebServer implements DataRepository
{
    @override
    double? fetchTemperature(String city)
    {
        return 42.0;
    }
}

class AnotherClass
{
    int myField = 42;

    void myMethod() => print(myField);
}

class SomeClass extends AnotherClass {}

class MyClass implements AnotherClass
{
    @override
    int myField = 66;

    @override
    void myMethod() => print("My name is omar!");
}

abstract class Bottle
{
    factory Bottle() => SodaBottle();
    void open();
}

class SodaBottle implements Bottle
{
    @override
    void open() => print("Fizz fizz");
}

abstract class NoteRepository
{
    factory NoteRepository()
    {
        List <String> notes = ["note1" , "note2"];
        return FakeDatabase(notes);
    }

    void fetchNoteMaker(String note);
    void fetchNoteDescription(String note);
    bool? isUsed(String note);
    int? fetchNumberOfNotes();
}

class FakeDatabase implements NoteRepository
{
    FakeDatabase(this.notes);

    List <String> notes;
    
    @override
    void fetchNoteDescription(String note)
    {
        print("Note Description:");
        print("Note Length: ${note.length}");
        print("Note Datetime: ${DateTime.now()}");
    }
    
    @override
    void fetchNoteMaker(String note)
    {
        print("Note Maker: ${note.runtimeType}");
    }
    
    @override
    int? fetchNumberOfNotes()
    {
        int counter = 0;
        for (int i = 0 ; i < notes.length ; i++)
        {
            counter++;
        }
        return counter;
    }
    
    @override
    bool? isUsed(String note)
    {
        bool result = false;
        for (final note in notes)
        {
            if (note.isEmpty)
            {
                result = true;
            }
        }
        return result;
    }
}
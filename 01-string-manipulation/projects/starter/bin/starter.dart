void main()
{
    const userInput = 'sPoNgEbOb@eXaMpLe.cOm';
    final lowerCase = userInput.toLowerCase();
    print(lowerCase);

    final upperCase = lowerCase.toUpperCase();
    print(upperCase);

    const anotherUserInput = '  221 Baker St.  ';
    final leftTrimmed = anotherUserInput.trimLeft(); // '221 Baker St. '
    final rightTrimmed = anotherUserInput.trimRight(); // '  221 Baker St.'
    final allTrimmed = anotherUserInput.trim(); // '221 Baker St.'
    print(leftTrimmed);
    print(rightTrimmed);
    print(allTrimmed);

    final time = Duration(hours: 1 , minutes: 2 , seconds: 3);
    final hours = time.inHours;
    final minutes = '${time.inMinutes % 60}'.padLeft(2 , '0');
    final seconds = '${time.inSeconds % 60}'.padLeft(2 , '0');
    final timeString = '$hours:$minutes:$seconds';
    print(timeString);

    const csvFile = 'Martin,Emma,12,Paris,France';
    final fields = csvFile.split(',');
    print(fields);

    for (String field in fields)
    {
        print(field);
    }

    final joined = fields.join('-');
    print(joined);

    const phrase = 'Live And Learn';
    final withUnderscores = phrase.replaceAll(' ' , '_');
    print(withUnderscores);

    const text = 'Stay Hard And Keep Pushing!';
    final firstOccurrence = text.replaceFirst(' ' , '_');
    print(firstOccurrence); // Stay_Hard And Keep Pushing!

    // Exercise
    const countries =
'''
France
USA
Germany
Benin
China
Mexico
Mongolia''';

    final listOfCountries = countries.split('\n');
    print(listOfCountries);

    const anotherText = "How's the Dart book going? :]";
    const emoji = '😊';
    final emojiText = anotherText.replaceAll(':]' , emoji);
    print(emojiText);

    final message = StringBuffer();
    message.write('Hello,');
    message.write(' My Name Is ');
    message.write('Omar.');
    message.writeAll(["Hello", "World"] , " Beautiful ");
    message.clear();
    print(message);

    final powersOfTwo = StringBuffer();
    for (int i = 2 ; i <= 1024 ; i *= 2)
    {
        powersOfTwo.write('$i ');
    }
    print(powersOfTwo);

    // Exercise
    final buffer = StringBuffer();
    for (int i = 1 ; i <= 10 ; i++)
    {
        for (int j = 1 ; j <= 10 ; j++)
        {
            if (j == i) buffer.write(' ');
            else buffer.write('*');
            if (j == 10) buffer.write('\n');
        }
    }
    print(buffer);

    
}

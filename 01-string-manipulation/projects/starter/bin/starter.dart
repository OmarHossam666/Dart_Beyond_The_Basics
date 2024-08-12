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

    const someText = 'I Love Dart!';
    print(someText.startsWith('I')); // true
    print(someText.endsWith('Dart!')); // true
    print(someText.contains('Love')); // true
    print(someText.contains('Flutter')); // false

    final regex = RegExp('cat');
    print(regex.isCaseSensitive); // true
    print(regex.isDotAll); // false
    print(regex.isMultiLine); // false
    print(regex.isUnicode); // false
    print(regex.pattern); // cat
    print(regex.runtimeType); // RegExp
    print(regex.hasMatch('cats')); // true
    print(regex.hasMatch('concatenation')); // true
    print(regex.hasMatch('dog')); // false
    print('cats'.contains(regex)); // true
    print('concatenation'.contains(regex)); // true
    print('dog'.contains(regex)); // false

    final singleMatch = RegExp('c.?t'); // Zero or one instance of any character
    print(singleMatch.hasMatch('cat')); // true
    print(singleMatch.hasMatch('cot')); // true
    print(singleMatch.hasMatch('cut')); // true
    print(singleMatch.hasMatch('ct')); // true

    final multipleMatch = RegExp('wo+w'); // One or more instance of o character
    print(multipleMatch.hasMatch('ww')); // false
    print(multipleMatch.hasMatch('wow')); // true
    print(multipleMatch.hasMatch('woow')); // true
    print(multipleMatch.hasMatch('wooooow')); // true
    print(multipleMatch.hasMatch('wooooooooow')); // true

    final optionalMultipleMatch = RegExp('wo*w'); // Zero or more instance of o character
    print(optionalMultipleMatch.hasMatch('ww')); // true
    print(optionalMultipleMatch.hasMatch('wow')); // true
    print(optionalMultipleMatch.hasMatch('woow')); // true
    print(optionalMultipleMatch.hasMatch('wooooow')); // true
    print(optionalMultipleMatch.hasMatch('wooooooooow')); // true

    final anyOneOrMore = RegExp('w.*w'); // Zero or more instance of any character
    print(anyOneOrMore.hasMatch('waaaaaaw')); // true
    print(anyOneOrMore.hasMatch('weeeeeeeew')); // true
    print(anyOneOrMore.hasMatch('woooooooooooow')); // true
    print(anyOneOrMore.hasMatch('ww')); // true

    final set = RegExp('b[oa]t'); // One of o or one of a but not both.
    print(set.hasMatch('boat')); // false
    print(set.hasMatch('bat')); // true
    print(set.hasMatch('bot')); // true
    print(set.hasMatch('baot')); // false
    print(set.hasMatch('baat')); // false
    print(set.hasMatch('boot')); // false

    final letters = RegExp('[a-zA-Z]'); // a range from a to z and a range from A to Z
    print(letters.hasMatch('a')); // true
    print(letters.hasMatch('A')); // true
    print(letters.hasMatch('Z')); // true
    print(letters.hasMatch('123s')); // true
    print(letters.hasMatch('6')); // false
    print(letters.hasMatch('Aa')); // true

    final excluded = RegExp('b[^oa]t'); // All characters except o and a and white space.
    print(excluded.hasMatch('boat')); // false
    print(excluded.hasMatch('bat')); // false
    print(excluded.hasMatch('bot')); //  false
    print(excluded.hasMatch('bt')); // false
    print(excluded.hasMatch('backet')); // false

    final escaped = RegExp(r'c\.t');
    print(escaped.hasMatch('c.t')); // true
    print(escaped.hasMatch('cat')); // false

    // final numbers = RegExp(r'[0-9]');
    // print(numbers.hasMatch('5512315')); // true
    // print(numbers.hasMatch('omar1234')); // true

    // final onlyNumbers = RegExp(r'^[0-9]+$');
    // print(onlyNumbers.hasMatch('01018166147')); // true
    // print(onlyNumbers.hasMatch('01003727266')); // true
    // print(onlyNumbers.hasMatch('010245O8855')); // false

    const password = 'Omar1234';

    final lowerCases = RegExp(r'[a-z]');
    final upperCases = RegExp(r'[A-Z]');
    final numbers = RegExp(r'[0-9]');
    final goodLength = RegExp(r'.{12,}');

    if (!password.contains(lowerCases))
    {
        print('Your password does not contain lowercases.');
    }
    if (!password.contains(upperCases))
    {
        print('Your password does not contain uppercases.');
    }
    if (!password.contains(numbers))
    {
        print('Your password does not contain numbers.');
    }
    if (!password.contains(goodLength))
    {
        print('Your password must have at least 12 characters long.');
    }
    else
    {
        print('Your password is ok!');
    }

    final oneDigit = RegExp(r'\d'); // Matches digits.
    print(oneDigit.hasMatch('1')); // true
    print(oneDigit.hasMatch('2')); // true
    print(oneDigit.hasMatch('3')); // true
    print(oneDigit.hasMatch('4')); // true
    print(oneDigit.hasMatch('5')); // true
    print(oneDigit.hasMatch('6')); // true

    final nonDigit = RegExp(r'\D'); // Matches non-digits.
    print(nonDigit.hasMatch('1')); // false
    print(nonDigit.hasMatch('2')); // false
    print(nonDigit.hasMatch('3')); // false
    print(nonDigit.hasMatch('4')); // false
    print(nonDigit.hasMatch('5')); // false
    print(nonDigit.hasMatch('6')); // false

    final whiteSpace = RegExp(r'\s'); // Matches whitespace character
    print(whiteSpace.hasMatch(' ')); // true
    print(whiteSpace.hasMatch('Omar Hossam Fathey')); // true
    print(whiteSpace.hasMatch('OmarHossam')); // false

    final nonWhiteSpace = RegExp(r'^\S+$'); // Matches non-whitespace characters
    print(nonWhiteSpace.hasMatch(' ')); // false
    print(nonWhiteSpace.hasMatch('Omar Hossam Fathey')); // false
    print(nonWhiteSpace.hasMatch('OmarHossam')); // true

    final alphanumeric = RegExp(r'\w'); // Matches an alphanumeric character => [a-zA-z0-9]
    print(alphanumeric.hasMatch('Aa1')); // true
    print(alphanumeric.hasMatch('#@!')); // false

    final nonAlphanumeric = RegExp(r'\W'); // Matches non-alphanumeric character
    print(nonAlphanumeric.hasMatch('Bb6')); // false
    print(nonAlphanumeric.hasMatch('#@!')); // true

    final unicodeCharacter = RegExp(r'\u00A9'); // Matches unicode character using unicode value
    print(unicodeCharacter.hasMatch('@')); // false
    print(unicodeCharacter.hasMatch('©')); // true

    // Exercise
    const creditCard = '1234567891234567';
    final onlyNumbers = RegExp(r'^\d+$');
    final exactLength = RegExp(r'\d{16}');

    if (!creditCard.contains(onlyNumbers))
    {
        print('Your credit card must contains only numbers.');
    }
    if (!creditCard.contains(exactLength))
    {
        print('Your credit card must have exactly 16 digits');
    }
    else
    {
        print('Your credit card is valid.');
    }
}

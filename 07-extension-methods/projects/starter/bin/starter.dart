void main()
{
    String input = 'abc';
    print(encode(input)); // bcd

    String output = 'def'.encoded;
    print(output); // efg

    String original = 'bcd'.decoded;
    print(original); // abc

    String real = 'efg'.decoded;
    print(real); // def

    String message = 'I like extension';
    String encodedMessage = message.encoded;
    String decodedMessage = encodedMessage.decoded;
    print(encodedMessage);
    print(decodedMessage);

    int number = 5;
    print(number.cubed); // 125

    int hour = 3;
    int minute = 3.minutes;
    print('hours: $hour'); // 3
    print('Minutes: $minute'); // 180
}


String encode(String input)
{
    final output = StringBuffer();

    for (final codePoint in input.runes)
    {
        output.writeCharCode(codePoint + 1);
    }

    return output.toString();
}

extension on String
{
    String get encoded => _code(1);
    String get decoded => _code(-1);

    String _code(int step)
    {
        final output = StringBuffer();

        for (final codePoint in runes)
        {
            output.writeCharCode(codePoint + step);
        }

        return output.toString();
    }
}

extension on int
{
    int get cubed => this * this * this;

    int get minutes => this * 60;
}
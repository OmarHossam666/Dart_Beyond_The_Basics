void main() {
  // print(1 / 0);
  // print(1 ~/ 0);

  // dynamic result = null;
  // print(result.isEven);

  // const malformedJson = "abc";
  // print(jsonDecode(malformedJson));

  // print(int.parse("42"));
  // print(int.parse("hello"));

  // function1();

  // final characters = ' abcdefghijklmnopqrstuvwxyz!';
  // final data = [4, 1, 18, 20, 0, 9, 19, 0, 6, 21, 14, 27];
  // final buffer = StringBuffer();

  // for (final index in data) {
  //   final letter = characters[index];
  //   buffer.write(letter);
  // }
  // print(buffer);

  // const json = '{"name": "Omar", "age": 20}';
  // try {
  //   dynamic result = jsonDecode(json);
  //   print(result);
  // } catch (error) {
  //   print("An error occurred: $error");
  // }

  // const json = "abc";

  // try {
  //   dynamic result = jsonDecode(json);
  //   print(result);
  // } on FormatException {
  //   print("Invalid JSON Format!");
  // }

  // final stringNumbers = ["42", "hello"];

  // try {
  //   for (final stringNumber in stringNumbers) {
  //     final number = int.parse(stringNumber);
  //     print(number ~/ 0);
  //   }
  // } on FormatException {
  //   handleFormatException();
  // } on UnsupportedError {
  //   handleUnsupportedError();
  // }

  // final database = FakeDataBase();
  // database.open();

  // try {
  //   final data = database.fetchData();
  //   final number = int.parse(data);

  //   print("The number is $number.");
  // } on FormatException {
  //   print("Invalid number format!");
  // } finally {
  //   database.close();
  // }

  const password = "Password1234";

  try {
    validatePassword(password);
    print("password is valid.");
  } on ShortPasswordException catch (error) {
    print(error.message);
  } on NoUpperCaseLettersException catch (error) {
    print(error.message);
  } on NoLowerCaseLettersException catch (error) {
    print(error.message);
  } on NoNumbersException catch (error) {
    print(error.message);
  }

  // Challenge 01
  final numbers = ['3', '1E+8', '1.25', 'four', '-0.01', 'NaN', 'Infinity'];

  for (final number in numbers) {
    try {
      final result = double.parse(number);
      print("The number is $result.");
    } on FormatException catch (error) {
      print("An error occurred: $error");
      print("The value is not a valid number.");
    }
  }

  // Challenge 02
  const postalCode = "55487";

  try {
    validatePostalCode(postalCode);
    print("Postal code is valid.");
  } on InvalidPostalCodeException catch (error) {
    print(error.message);
  }
}

void function1() => function2();

void function2() => function3();

void function3() => int.parse("hello");

void handleFormatException() {
  print("You tried to parse a non-numeric string!");
}

void handleUnsupportedError() {
  print("You tried to divide by zero!");
}

class FakeDataBase {
  void open() => print("Opening database...");

  void close() => print("Closing database...");

  String fetchData() => "42";
}

class ShortPasswordException implements Exception {
  ShortPasswordException(this.message);

  final String message;
}

class NoLowerCaseLettersException implements Exception {
  NoLowerCaseLettersException(this.message);

  final String message;
}

class NoUpperCaseLettersException implements Exception {
  NoUpperCaseLettersException(this.message);

  final String message;
}

class NoNumbersException implements Exception {
  NoNumbersException(this.message);

  final String message;
}

void validateLength(String password) {
  final passwordLength = RegExp(r".{12,}");

  if (!password.contains(passwordLength)) {
    throw ShortPasswordException(
        "Password must be at least 12 characters long.");
  }
}

void validateUpperCase(String password) {
  final upperCase = RegExp(r"[A-Z]");

  if (!password.contains(upperCase)) {
    throw NoUpperCaseLettersException(
        "Password must contain an uppercase letter.");
  }
}

void validateLowerCase(String password) {
  final lowerCase = RegExp(r"[a-z]");

  if (!password.contains(lowerCase)) {
    throw NoLowerCaseLettersException(
        "Password must contain a lowercase letter.");
  }
}

void validateNumbers(String password) {
  final numbers = RegExp(r"[0-9]");

  if (!password.contains(numbers)) {
    throw NoNumbersException("Password must contain a number.");
  }
}

void validatePassword(String password) {
  validateLength(password);
  validateUpperCase(password);
  validateLowerCase(password);
  validateNumbers(password);
}

class InvalidPostalCodeException implements Exception {
  InvalidPostalCodeException(this.message);

  final String message;
}

void validatePostalCode(String postalCode) {
  final postalCodePattern = RegExp(r"^\d{5}$");

  if (!postalCode.contains(postalCodePattern)) {
    throw InvalidPostalCodeException("Invalid postal code format.");
  }
}

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:math';

Future<void> main() async {
  // print("Before the future.");

  // Future<int>.delayed(Duration(seconds: 1), () => 65)
  //     .then((value) => print("Value: $value"))
  //     .catchError((Object error) => print("Error: $error"))
  //     .whenComplete(() => print("Future is Complete."));

  // print("After the future.");

  // print("Before the future.");

  // try {
  //   final value = await Future<int>.delayed(Duration(seconds: 1), () => 65);
  //   print("Value: $value");
  // } catch (error) {
  //   print("Error: $error");
  // } finally {
  //   print("Future is complete.");
  // }

  // print("After the future.");

  // try {
  //   final String uri = 'https://jsonplaceholder.typicode.com/todos/1';

  //   final parsedUrl = Uri.parse(uri);

  //   final response = await http.get(parsedUrl);

  //   final statusCode = response.statusCode;

  //   if (statusCode != 200) {
  //     throw HttpException("$statusCode");
  //   }

  //   final jsonString = response.body;

  //   dynamic jsonMap = jsonDecode(jsonString);

  //   final toDo = ToDo.fromJson(jsonMap);

  //   print(toDo);
  // } on HttpException catch(error) {
  //   print(error);
  // } on SocketException catch(error) {
  //   print(error);
  // } on FormatException catch(error) {
  //   print(error);
  // }

  // Exercise 01
  // try {
  //   final String message = await Future<String>.delayed(
  //     Duration(seconds: 2),
  //     () => "I am from the future.",
  //   );

  //   print(message);
  // } catch (error) {
  //   print("An Error Occurred: $error");
  // }

  // final FakeWebServer fakeWebServer = FakeWebServer();

  // try {
  //   final city = "Mansoura";
  //   final degrees = await fakeWebServer.fetchTemperature(city);
  //   print("It's $degrees in $city.");
  // } on ArgumentError catch (error) {
  //   print("An Error Occurred: $error");
  // }

  // Challenge 01
  // final web = FakeWebServer();

  // try {
  //   final city = "Mansoura";
  //   final degree = await web.fetchTemperature(city);
  //   print("It's $degree in $city.");
  // } on ArgumentError catch (error) {
  //   print("An Error Occurred: $error");
  // }

  // Challenge 02
  // final url = 'https://fcc-weather-api.glitch.me/api/current?lat=45.5&lon=-122.7';
  // final parsedUri = Uri.parse(url);

  // try {
  //   final response = await http.get(parsedUri);

  //   final statusCode = response.statusCode;

  //   if (statusCode != 200) {
  //     throw HttpException("$statusCode");
  //   }

  //   final jsonString = response.body;

  //   final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

  //   print(jsonMap);
  // } on HttpException catch (error) {
  //   print("An Error Occurred: $error");
  // } on SocketException catch (error) {
  //   print("An Error Occurred: $error");
  // } on FormatException catch (error) {
  //   print("An Error Occurred: $error");
  // }

  // Challenge 03
  const uri = 'https://jsonplaceholder.typicode.com/comments';
  final url = Uri.parse(uri);

  try {
    final response = await http.get(url);
    final statusCode = response.statusCode;

    if (response.statusCode != 200) {
      throw HttpException("$statusCode");
    }

    final json = response.body;
    final List<dynamic> jsonList = jsonDecode(json);
    final List<Comment> list = [];

    for (Map<String, dynamic> jsonMap in jsonList) {
      final comment = Comment.fromJson(jsonMap);
      list.add(comment);
    }

    print(list);
  } on HttpException catch (error) {
    print("$error");
  } on SocketException catch (error) {
    print("$error");
  } on FormatException catch (error) {
    print("$error");
  } finally {
    print("The response is arrived!");
  }
}

class ToDo {
  ToDo({
    required this.title,
    required this.id,
    required this.userId,
    required this.completed,
  });

  factory ToDo.fromJson(Map<String, dynamic> jsonMap) {
    return ToDo(
      title: jsonMap["title"] as String,
      id: jsonMap["id"] as int,
      userId: jsonMap["userId"] as int,
      completed: jsonMap["completed"] as bool,
    );
  }

  final int id;
  final int userId;
  final String title;
  final bool completed;

  @override
  String toString() {
    return 'userId: $userId\n'
        'id: $id\n'
        'title: $title\n'
        'completed: $completed';
  }
}

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) {
    final completer = Completer<double>();
    final random = Random().nextInt(10) + 1;

    if (random % 2 == 0) {
      completer.complete(32);
    } else {
      completer.completeError(ArgumentError("$city does not exist!"));
    }

    return completer.future;
  }
}

class Comment {
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> jsonMap) {
    return Comment(
      postId: jsonMap['postId'] as int,
      id: jsonMap['id'] as int,
      name: jsonMap['name'] as String,
      email: jsonMap['email'] as String,
      body: jsonMap['body'] as String,
    );
  }

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  @override
  String toString() {
    return 'postId: $postId\n'
        'id: $id\n'
        'name: $name\n'
        'email: $email\n'
        'body: $body\n';
  }
}

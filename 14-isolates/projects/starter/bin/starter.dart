import 'dart:io';
import 'dart:isolate';
import 'dart:convert';

Future<void> main() async {
  // final earth = Earth();
  // await earth.contactMars();

  // final int number = 40;
  // final int recursiveFibonacciNumber = recursiveFibonacci(number);
  // final int loopFibonacciNumber = loopFibonacci(number);
  // final int memoizedFibonacciNumber = recursiveFibonacci(number);
  // print("The Recursive Fibonacci of $number is $recursiveFibonacciNumber");
  // print("The Loop Fibonacci of $number is $loopFibonacciNumber");
  // print("The Memoized Fibonacci of $number is $memoizedFibonacciNumber");

  // Challenge 01
  // final ReceivePort receivePort = ReceivePort();
  // final int number = 40;

  // await Isolate.spawn<Map<String, Object?>>(fibonacci, {'sendPort': receivePort.sendPort, 'number': number});

  // final int result = await receivePort.first;
  // print("The Fibonacci of $number is $result");

  // Challenge 02
  final ReceivePort receivePort = ReceivePort();
  const jsonString = '''
{
"language": "Dart",
"feeling": "love it",
"level": "intermediate"
}
''';
  await Isolate.spawn(
      parseJson, {'sendPort': receivePort.sendPort, 'jsonString': jsonString});

  final result = await receivePort.first as Map<String, dynamic>;
  print(result);
}

int recursiveFibonacci(int number) {
  // Base Case
  if (number == 1 || number == 2) return 1;

  // Recursive Call
  return recursiveFibonacci(number - 1) + recursiveFibonacci(number - 2);
}

int loopFibonacci(int number) {
  var current = 1;
  var previous = 1;
  var done = 2;

  while (done < number) {
    final next = previous + current;
    previous = current;
    current = next;
    done++;
  }

  return current;
}

int memoizedFibonacci(int number, Map<int, int> cache) {
  // Base Case
  if (number == 1 || number == 2) return 1;

  if (cache.containsKey(number)) {
    return cache[number]!;
  }

  cache[number] = memoizedFibonacci(number - 1, cache) +
      memoizedFibonacci(number - 2, cache);

  return cache[number]!;
}

int recursiveFibonacciOptimized(int number) {
  Map<int, int> cache = <int, int>{};
  return memoizedFibonacci(number, cache);
}

void fibonacci(Map<String, Object?> arguments) {
  final SendPort sendPort = arguments['sendPort'] as SendPort;
  final int number = arguments['number'] as int;

  int previous = 1;
  int current = 1;
  int done = 2;

  while (done < number) {
    final int next = previous + current;
    previous = current;
    current = next;
    done++;
  }

  Isolate.exit(sendPort, current);
}

void parseJson(Map<String, Object?> arguments) {
  final SendPort sendPort = arguments['sendPort'] as SendPort;
  final String jsonString = arguments['jsonString'] as String;

  final jsonMap = jsonDecode(jsonString);

  Isolate.exit(sendPort, jsonMap);
}

class Work {
  Future<int> doSomething() async {
    print("Doing some work...");
    sleep(Duration(seconds: 1));
    return 42;
  }

  Future<int> doSomethingElse() async {
    print("Doing some other work...");
    sleep(Duration(seconds: 1));
    return 24;
  }
}

class Earth {
  final _recieveOnEarthPort = ReceivePort();
  SendPort? _sendToMarsPort;
  Isolate? _marsIsolate;

  Future<void> contactMars() async {
    if (_marsIsolate != null) {
      return; // This condition is used to to determine if _marsIsolate is created or initialized or not.
    }

    _marsIsolate = await Isolate.spawn<SendPort>(
      _entryPoint,
      _recieveOnEarthPort.sendPort,
    );

    _recieveOnEarthPort.listen((messageFromMars) async {
      await Future.delayed(Duration(seconds: 1));
      print("Message From Mars: $messageFromMars");

      if (messageFromMars is SendPort) {
        _sendToMarsPort = messageFromMars;
        _sendToMarsPort?.send("Hey From Earth.");
      } else if (messageFromMars == "Hey From Mars.") {
        _sendToMarsPort?.send("Can you help?");
      } else if (messageFromMars == "Sure.") {
        _sendToMarsPort?.send("doSomething");
        _sendToMarsPort?.send("doSomethingElse");
      } else if (messageFromMars is Map<String, Object?>) {
        final method = messageFromMars["method"] as String;
        final result = messageFromMars["result"] as int;
        print("The result of $method is $result");
      } else if (messageFromMars == "Done!") {
        print("Shutting down...");
        dispose();
      }
    });
  }

  void dispose() {
    _recieveOnEarthPort.close();
    _marsIsolate?.kill();
    _marsIsolate = null;
  }
}

void _entryPoint(SendPort sendToEarthPort) {
  final ReceivePort receiveOnMarsPort = ReceivePort();

  sendToEarthPort.send(receiveOnMarsPort.sendPort);

  final Work work = Work();

  receiveOnMarsPort.listen((messageFromEarth) async {
    await Future.delayed(Duration(seconds: 1));
    print("Message From Earth: $messageFromEarth");

    if (messageFromEarth == "Hey From Earth.") {
      sendToEarthPort.send("Hey From Mars.");
    } else if (messageFromEarth == "Can you help?") {
      sendToEarthPort.send("Sure.");
    } else if (messageFromEarth == "doSomething") {
      final int result = await work.doSomething();
      sendToEarthPort
          .send(<String, Object?>{"method": "doSomething", "result": result});
    } else if (messageFromEarth == "doSomethingElse") {
      final int result = await work.doSomethingElse();
      sendToEarthPort.send(
          <String, Object?>{"method": "doSomethingElse", "result": result});
      sendToEarthPort.send("Done!");
    }
  });
}

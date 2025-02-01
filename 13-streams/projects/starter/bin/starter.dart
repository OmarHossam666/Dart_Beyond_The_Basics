import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

Future<void> main() async {
  // final file = File('assets/text.txt');

  // final contents = await file.readAsString();

  // print(contents);

  // final file = File('assets/text_long.txt');

  // final stream = file.openRead();

  // final broadCastStream = stream.asBroadcastStream();

  // broadCastStream.listen((data) => print(data.length));

  // final file = File('assets/text_long.txt');

  // final stream = file.openRead();

  // await for (final data in stream) {
  //   print(data.length);
  // }

  // final file = File('assets/text_long.txt');

  // final stream = file.openRead();

  // stream.listen(
  //   (data) => print(data.length),
  //   onError: (error) => print("Error: $error"),
  //   onDone: () => print("The stream is finished."),
  // );

  // try {
  //   final file = File('assets/text_long.txt');

  //   final stream = file.openRead();

  //   await for (final data in stream) {
  //     print(data.length);
  //   }
  // } on FileSystemException catch (error) {
  //   print("Error: $error");
  // } finally {
  //   print("All Finished.");
  // }

  // final file = File('Does not exist!');

  // final stream = file.openRead();

  // stream.listen(
  //   (data) => print(data.length),
  //   onError: (error) => print("Error: $error"),
  //   onDone: () => print("All Finished."),
  // );

  // try {
  //   final file = File('Does not exist!');

  //   final stream = file.openRead();

  //   await for (final data in stream) {
  //     print(data.length);
  //   }
  // } on FileSystemException catch (error) {
  //   print("Error: $error");
  // } finally {
  //   print("All Finished.");
  // }

  // final file = File('assets/text_long.txt');

  // final stream = file.openRead();

  // StreamSubscription<List<int>>? subscription;
  // subscription = stream.listen(
  //   (data) {
  //     print(data.length);
  //     subscription?.cancel();
  //   },
  //   cancelOnError: true,
  //   onDone: () => print("All Finished."),
  // );

  // final file = File('assets/text.txt');

  // final stream = file.openRead();

  // stream.listen((data) => print(data));

  // final file = File('assets/text.txt');

  // final byteStream = file.openRead();

  // final stringStream = byteStream.transform(utf8.decoder);

  // await for (final data in stringStream) {
  //   print(data);
  // }

  // Exercise 01
  // final periodicStream = Stream<int>.periodic(
  //   Duration(seconds: 1),
  //   (value) => value,
  // ).take(10);

  // await for (final value in periodicStream) {
  //   print(value);
  // }

  // final first = Stream.value(45);
  // final second = Stream.empty();
  // final third = Stream.error("Error!");
  // final fourth = Stream.periodic(
  //   Duration(seconds: 1),
  //   (value) => value,
  // ).take(10);

  // fourth.forEach(print);

  // first.listen(
  //   (data) => print(data),
  //   onError: (error) => print(error),
  //   onDone: () => print("All Finished!"),
  // );

  // second.listen(
  //   (data) => print(data),
  //   onError: (error) => print("Error: $error"),
  //   onDone: () => print("All Finished!"),
  // );

  // third.listen(
  //   (data) => print(data),
  //   onError: (error) => print("Error: $error"),
  //   onDone: () => print("All Finished!"),
  // );

  // final first = Future.value(66);
  // final second = Future.error("An Error Occurred!");
  // final third = Future.delayed(
  //   Duration(seconds: 1),
  //   () => print("Omar"),
  // );
  // final fourth = Future.microtask(() => print("Hossam"));

  // final stream = Stream.fromFutures([first, second, third, fourth]);

  // stream.listen(
  //   (Object? data) => print(data),
  //   onDone: () => print("Done!"),
  //   onError: (error) => print("Error: $error"),
  // );

  // final first = Future(() => "Row");
  // final second = Future(() => "row");
  // final third = Future(() => "row");
  // final fourth = Future.delayed(Duration(milliseconds: 300), () => "your boat");

  // final stream = Stream.fromFutures([
  //   first,
  //   second,
  //   third,
  //   fourth,
  // ]);

  // stream.listen((data) => print(data));

  // final myIterable = hundredSquares();
  // myIterable.forEach(print);

  // final myStream = consciousness();
  // myStream.listen((data) => print(data));

  // final streamController = StreamController<String>();
  // final stream = streamController.stream;
  // final sink = streamController.sink;

  // sink.add("Grape");
  // sink.add("Grape");
  // sink.add("Grape");
  // sink.add("Grape");
  // sink.addError(Exception("Cherry"));
  // sink.close();

  // stream.listen(
  //   (data) => print(data),
  //   onError: (Object error) => print(error),
  //   onDone: () => print("Sink is closed!"),
  // );
  // await challenge01();

  // Challenge02
  final coinFlippingService = CoinFlippingService();

  coinFlippingService.onFlip.listen((data) => print(data));

  coinFlippingService.start();
}

class CoinFlippingService {
  final _controller = StreamController<String>();

  Stream<String> get onFlip => _controller.stream;

  Future<void> start() async {
    final list = ['Head', 'Tail'];

    for (int i = 0; i < 10; i++) {
      final random = Random().nextInt(2);
      await Future.delayed(Duration(seconds: 2 * i));
      _controller.add(list[random]);
    }
    await _controller.close();
  }
}

Iterable<int> hundredSquares() sync* {
  for (int i = 1; i <= 100; i++) {
    yield i * i;
  }
}

Stream<String> consciousness() async* {
  final data = ['con', 'sciou', 'sness'];
  for (final part in data) {
    await Future.delayed(Duration(seconds: 5));
    yield part;
  }
}

Future<void> challenge01() async {
  final url = Uri.parse('https://kodeco.com');

  final client = http.Client();

  final request = http.Request('GET', url);

  final response = await client.send(request);

  final stream = response.stream.asBroadcastStream();
  stream.listen(
    (data) => print(data.length),
    onError: (Object error) => print("An Error Occurred: $error"),
    onDone: () => client.close(),
  );

  final transformedStream = stream.transform(utf8.decoder);
  transformedStream.listen(
    (data) => print(data.length),
    onError: (Object error) => print("An Error Occurred: $error"),
    onDone: () => client.close(),
  );
}

void main() {
  // print("omar");

  // Future(() => print("hossam"));

  // print("fathey");

  // print("one");

  // Future(() => print("two"));

  // Future.microtask(() => print("three"));

  // print("four");

  // print("one");

  // Future(() => print("two")).then((value) => print("three"));

  // Future(() => print("four"));

  // print("five");

  // print("one");

  // Future.delayed(Duration(seconds: 1), () => print("two"));

  // Future(() => print("four"));

  // print("three");

  challenge01();
}

void challenge01() {
  print("1 synchronous");
  Future(() => print('2 event queue')).then(
    (value) => print('3 synchronous'),
  );
  Future.microtask(() => print('4 microtask queue'));
  Future.microtask(() => print('5 microtask queue'));
  Future.delayed(
    Duration(seconds: 1),
    () => print('6 event queue'),
  );
  Future(() => print('7 event queue')).then(
    (value) => Future(() => print('8 event queue')),
  );
  Future(() => print('9 event queue')).then(
    (value) => Future.microtask(
      () => print('10 microtask queue'),
    ),
  );
  print('11 synchronous');
}
/*
  1 synchronous
  11 synchronous
  4 microtask queue
  5 microtask queue
  2 event queue
  3 synchronous
  7 event queue
  9 event queue
  10 microtask queue
  8 event queue
  6 event queue
*/

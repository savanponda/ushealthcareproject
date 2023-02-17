class CounterEvent {
  const CounterEvent();
}

class Increment extends CounterEvent {
  final int value1;
  const Increment({this.value1 = 1});
}

class Decrement extends CounterEvent {
  final int value1;
  const Decrement({this.value1 = 1});
}


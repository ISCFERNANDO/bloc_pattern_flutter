class CounterRepository {
  int _count = 0;

  static CounterRepository _instance = CounterRepository._internal();

  CounterRepository._internal();

  factory CounterRepository() {
    return _instance;
  }

  int get() {
    return _count;
  }

  void increment() {
    _count++;
  }

  void decrement() {
    _count--;
  }

  void doubleIncrement() {
    _count += 2;
  }

  void doubleDecrement() {
    _count -= 2;
  }
}

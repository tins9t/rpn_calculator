abstract class Command {
  void apply(List<num> stack);
}

class AddCommand implements Command {
  num card1 = 0;
  num card2 = 0;

  @override
  void apply(List<num> stack) {
    card1 = stack.removeLast();
    card2 = stack.removeLast();
    stack.add(card1 + card2);
  }
}

class MultiplyCommand implements Command {
  num card1 = 0;
  num card2 = 0;

  @override
  void apply(List<num> stack) {
    card1 = stack.removeLast();
    card2 = stack.removeLast();
    stack.add(card1 * card2);
  }
}

class ExtractCommand implements Command {
  num card1 = 0;
  num card2 = 0;

  @override
  void apply(List<num> stack) {
    card1 = stack.removeLast();
    card2 = stack.removeLast();
    stack.add(card1 - card2);
  }
}

  class DivideCommand implements Command {
  num card1 = 0;
  num card2 = 0;

  @override
  void apply(List<num> stack) {
  card1 = stack.removeLast();
  card2 = stack.removeLast();
  stack.add(card1 / card2);
  }
}


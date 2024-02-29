import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator/command.dart';

void main() {
  test('Addition Test', () {
    List<num> stack = [2, 2];
    AddCommand().apply(stack);
    expect(stack, equals([4]));
  });

  test('Multiplication Test', () {
    List<num> stack = [5, 6];
    MultiplyCommand().apply(stack);
    expect(stack, equals([30]));
  });

  test('Subtraction Test', () {
    List<num> stack = [7, 9];
    ExtractCommand().apply(stack);
    expect(stack, equals([2]));
  });

  test('Division Test', () {
    List<num> stack = [2, 6];
    DivideCommand().apply(stack);
    expect(stack, equals([3]));
  });
}

import 'package:flutter/material.dart';
import 'command.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = '';
  List<num> stack = [];
  num result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RPN Calculator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ' $userInput',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('+'),
              _buildActionButton('*'),
              _buildActionButton('-'),
              _buildActionButton('/'),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8), // Adjust top padding as needed
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  userInput = '';
                  result = 0;
                  stack.clear(); // Clear the stack
                });
              },
              child: Text('Clear'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Result: $result',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          userInput += number;
        });
      },
      child: Text(number),
    );
  }

  Widget _buildActionButton(String action) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (action == '+') {
            stack.addAll(userInput.split('').map((char) => double.parse(char)));
            userInput = '';
            AddCommand().apply(stack);
            result = stack.last;
          } else if (action == '*') {
            stack.addAll(userInput.split('').map((char) => double.parse(char)));
            userInput = '';
            MultiplyCommand().apply(stack);
            result = stack.last;
          } else if (action == '-') {
            stack.addAll(userInput.split('').map((char) => double.parse(char)));
            userInput = '';
            ExtractCommand().apply(stack);
            result = stack.last;
          }
          else if (action == '/') {
            stack.addAll(userInput.split('').map((char) => double.parse(char)));
            userInput = '';
            DivideCommand().apply(stack);
            result = stack.last;
          }
        });
      },
      child: Text(action),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(70, 70),
            textStyle: TextStyle(fontSize: 25),
            foregroundColor: const Color.fromARGB(238, 245, 244, 244),
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double firstnum = 0;
  double secondnum = 0;
  String history = '';
  String display = '0';
  String result = '';
  String operation = '';

  void btnclick(String value) {
    setState(() {
      if (value == 'C') {
        firstnum = 0;
        secondnum = 0;
        history = '';
        display = '0';
        result = '';
        operation = '';
      } else if (value == 'D') {
        if (display.isNotEmpty && display != '0') {
          display = display.substring(0, display.length - 1);
          if (display.isEmpty) display = '0';
        }
      } else if (value == '+' || value == '-' || value == '*' || value == '/' || value == '%') {
        if (display.isNotEmpty) {
          firstnum = double.parse(display);
          operation = value;

          if (value == '%') {
            result = (firstnum / 100).toString();
            history = '$firstnum%';
            display = result;
            operation = '';
          } else {
            history = '$firstnum $operation';
            display = '0';
          }
        }
      } else if (value == '=') {
        if (display.isNotEmpty && operation.isNotEmpty) {
          secondnum = double.parse(display);

          switch (operation) {
            case '+':
              result = (firstnum + secondnum).toString();
              break;
            case '-':
              result = (firstnum - secondnum).toString();
              break;
            case '*':
              result = (firstnum * secondnum).toString();
              break;
            case '/':
              result = secondnum != 0 ? (firstnum / secondnum).toStringAsFixed(2) : 'Error';
              break;
            case '%':
              result = (firstnum.remainder(secondnum)).toString();
              break;
          }

          history = '$firstnum $operation $secondnum =';
          display = result;
        }
      } 
      else {
    if (display == '0'&& value != '.') {
    display = value;
  } else {
    if (value == '.' && display.contains('.')) return;
    display += value;
  }
}

     
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment(0.8, 1.0),
            padding: EdgeInsets.only(right: 12),
            child: Text(
              history,
              style: TextStyle(color: Colors.blueGrey, fontSize: 24),
            ),
          ),
          Container(
            alignment: Alignment(0.8, 1.0),
            padding: EdgeInsets.only(right: 12),
            child: Text(
              display,
              style: TextStyle(color: Colors.amberAccent, fontSize: 70),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                  btnclick('D');
                  },
                  child: Text('D'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), backgroundColor: Colors.grey)),
              ElevatedButton(
                  onPressed: () {
                   btnclick('C');
                  },
                  child: Text('C'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), backgroundColor: Colors.grey)),
              ElevatedButton(
                  onPressed: () {
                    btnclick('%');
                  },
                  child: Text('%'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.amberAccent)),
              ElevatedButton(
                  onPressed: () {
                   btnclick('*');
                  },
                  child: Text('*'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.amberAccent)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                  btnclick('7');
                  },
                  child: Text('7'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                    btnclick('8');
                  },
                  child: Text('8'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                   btnclick('9');
                  },
                  child: Text('9'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                    btnclick('/');
                  },
                  child: Text('/'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.amberAccent)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                   btnclick('4');
                  },
                  child: Text('4'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                   btnclick('5');
                  },
                  child: Text('5'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                    btnclick('6');
                  },
                  child: Text('6'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                    btnclick('-');
                  },
                  child: Text('-'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.amberAccent)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                   btnclick('1');
                  },
                  child: Text('1'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                   btnclick('2');
                  },
                  child: Text('2'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                    btnclick('3');
                  },
                  child: Text('3'),
                  style: ElevatedButton.styleFrom(shape: CircleBorder())),
              ElevatedButton(
                  onPressed: () {
                    btnclick('+');
                  },
                  child: Text('+'),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.amberAccent)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                 btnclick('0');
                },
                child: Text('0'),
                style: ElevatedButton.styleFrom(minimumSize: Size(165, 50)),
              ),
              ElevatedButton(
                onPressed: () {
                  btnclick('.');
                },
                child: Text('.'),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), minimumSize: Size(70, 80)),
              ),
              ElevatedButton(
                onPressed: () {
                  btnclick('=');
                },
                child: Text('='),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.amberAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

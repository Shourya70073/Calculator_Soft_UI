import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> op = [
    "+",
    "-",
    "X",
    "/",
    "1",
    "2",
    "3",
    "%",
    "4",
    "5",
    "6",
    "CC",
    "7",
    "8",
    "9",
    "="
  ];
  String t = "";
  void calc(int i) {
    int jp = 0;
    if (op[i] == "CC") {
      setState(() {
        t = "";
      });
    }
   else if (op[i] == "=") {
      for (int j = 0; j < t.length; j++) {
        if (t.substring(j, j + 1) == "+" ||
            t.substring(j, j + 1) == "-" ||
            t.substring(j, j + 1) == "X" ||
            t.substring(j, j + 1) == "/" ||
            t.substring(j, j + 1) == "%" ||
            t.substring(j, j + 1) == "^") {
          jp = j;
        }
      }

      var a = int.parse(t.substring(0, jp));
      var b = int.parse(t.substring(jp + 1, t.length));
      var ch = (t.substring(jp, jp + 1));
      switch (ch) {
        case "+":
          var c = a + b;
          var d = c.toString();
          setState(() {
            t = d;
          });
          break;
        case "-":
          var c = a - b;
          var d = c.toString();
          setState(() {
            t = d;
          });
          break;
        case "X":
          var c = a * b;
          var d = c.toString();
          setState(() {
            t = d;
          });
          break;
        case "/":
          var c = a / b;
          var d = c.toString();
          setState(() {
            t = d;
          });
          break;

        case "^":
          var c = pow(a, b);
          var d = c.toString();
          setState(() {
            t = d;
          });
          break;
        case "%":
          var c = a % b;
          var d = c.toString();
          setState(() {
            t = d;
          });
          break;
        default:
      }
    } else {
      setState(() {
        t = t + op[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.deepPurple,
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              t,
              style: TextStyle(color: Colors.white, fontSize: 40.0),
              textDirection: TextDirection.ltr,
            ),
            height: 100,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: GridView.builder(
                itemCount: op.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: (MaterialButton(
                      onPressed: () {
                        calc(index);
                      },
                      child: Center(
                          child: Text(
                        op[index],
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                      color: Colors.pink,
                      height: 50,
                      minWidth: 50,
                    )),
                  );
                }),
          ),
        )
      ]),
    ));
  }
}

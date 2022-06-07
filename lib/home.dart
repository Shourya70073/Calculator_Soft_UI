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
    "x",
    "<",
    "1",
    "2",
    "3",
    "/",
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
    } else if (op[i] == "<") {
      if (t.length > 0) {
        setState(() {
          t = t.substring(0, t.length - 1);
        });
      }
    } else if (op[i] == "=") {
      for (int j = 0; j < t.length; j++) {
        if (t.substring(j, j + 1) == "+" ||
            t.substring(j, j + 1) == "-" ||
            t.substring(j, j + 1) == "x" ||
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
        case "x":
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
      backgroundColor: Colors.grey[300],
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              t,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () => calc(index),
                      child: (Container(
                        child: Center(
                            child: Text(
                          op[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                      )),
                    ),
                  );
                }),
          ),
        )
      ]),
    ));
  }
}

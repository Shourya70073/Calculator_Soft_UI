// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_const_constructors

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
  var p;
  var q;
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
  void checkcolor(int d) {
    if (d == 0 ||d == 1 ||d == 2 ||d == 3 || d == 7 || d == 11 || d == 15) {
      q = true;
    } else {
      q = false;
    }
  }

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
        title: Text("CALCULATOR"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Expanded(
            flex: 2,
            child: Container(
              
              alignment: Alignment.bottomRight,
              child: Text(
                t,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
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
                    checkcolor(index);
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () => calc(index),
                        child: (Container(
                          child: Center(
                              child: Text(
                            op[index],
                            style: TextStyle(
                                color: q?Colors.white:Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )
                          ),
                          decoration: BoxDecoration(
                              color: q?Colors.black:Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
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
        ],
      ),
    ));
  }
}

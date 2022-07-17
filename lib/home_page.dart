import 'dart:math';

import 'package:bmi_applications/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double height = 0;
  int weight = 0;
  int age = 0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Body Mass Index"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                firstPattern(context, "male"),
                firstPattern(context, "female"),
              ],
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "CM",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                        min: 0.0,
                        max: 250,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                secondPattern(context, "weight"),
                secondPattern(context, "age"),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.teal,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    result = weight / pow((height / 100), 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage(
                            result: result,
                            age: age,
                            isMale: isMale,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded secondPattern(BuildContext context, String type) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == "weight" ? "Weight" : "Age",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                type == "weight" ? "$weight" : "$age",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      if (weight > 0 || age > 0) {
                        setState(() {
                          type == "weight" ? weight-- : age--;
                        });
                      }
                    },
                    child: const Icon(Icons.minimize),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        type == "weight" ? weight++ : age++;
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded firstPattern(BuildContext context, String type) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMale = type == "male" ? true : false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: (isMale && type == "male") || (!isMale && type == "female")
                  ? Colors.teal
                  : Colors.blueGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (type == "male") ? Icons.male : Icons.female,
                  size: 90,
                  color: Colors.white,
                ),
                Text(
                  (type == "male") ? "Male" : "Female",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

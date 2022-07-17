import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;
  String get resultPhrase {
    if (result >= 30) {
      return 'Obes';
    } else if (result < 30 && result > 25) {
      return 'Overweight';
    } else if (result >= 18.5 && result <= 24.9) {
      return 'Normal';
    } else {
      return 'thine';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "result",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                textAlign: TextAlign.center,
                "The Gender is : ${isMale ? "Male" : "Female"}",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                textAlign: TextAlign.center,
                "The Result is : ${result.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                textAlign: TextAlign.center,
                "The Healthiness is : $resultPhrase",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                textAlign: TextAlign.center,
                "The Age is : $age",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

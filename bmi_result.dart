import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final bool isMale;
  final double height;
  final double weight;

  const BMIResult({
    super.key,
    required this.isMale,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double BMI = calculateBmi();
    String category = getCategory(BMI);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI Result is: ${BMI.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            getIcon(category),
          ],
        ),
      ),
    );
  }

  double calculateBmi() {
    return weight / ((height / 100) * (height / 100));
  }

  String getCategory(double bmi) {
    if (isMale) {
      if (bmi < 18.5) {
        return 'Underweight';
      } else if (bmi < 25.0) {
        return 'Normal weight';
      } else if (bmi < 30.0) {
        return 'Overweight';
      } else {
        return 'Obesity';
      }
    } else {
      if (bmi < 18.5) {
        return 'Underweight';
      } else if (bmi < 24.0) {
        return 'Normal weight';
      } else if (bmi < 29.0) {
        return 'Overweight';
      } else {
        return 'Obesity';
      }
    }
  }

  Widget getIcon(String category) {
    if (category == 'Underweight') {
      return Icon(Icons.warning, color: Colors.yellow);
    } else if (category == 'Normal weight') {
      return Icon(Icons.sentiment_satisfied, color: Colors.green);
    } else if (category == 'Overweight') {
      return Icon(Icons.warning, color: Colors.orange);
    } else {
      return Icon(Icons.warning, color: Colors.red);
    }
  }
}

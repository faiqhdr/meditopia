import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'result.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  String selectedGender = "";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      String category = getBMICategory(bmi);
      String interpretation = getBMIInterpretation(category);

      // Store the BMI calculation results in Firestore
      FirebaseFirestore.instance.collection('bmi').add({
        'gender': selectedGender,
        'height': height,
        'weight': weight,
        'result': bmi,
        'category': category,
        'interpretation': interpretation,
      });

      // Navigate to BmiResult screen
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BmiResult(
                bmi: bmi, category: category, interpretation: interpretation)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text('Please enter valid height and weight.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return 'Normal Weight';
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String getBMIInterpretation(String category) {
    switch (category) {
      case 'Underweight':
        return 'You are underweight. You should eat more and consult a doctor.';
      case 'Normal Weight':
        return 'You have a normal weight. Keep up the good work!';
      case 'Overweight':
        return 'You are overweight. You should consider exercising and maintaining a healthy diet.';
      case 'Obese':
        return 'You are obese. It is important to take immediate steps to improve your health.';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 17,
            ),
            child: Column(
              children: [
                // Header Area.
                Header(),
                // Gender Area.
                Gender(selectGender: selectGender),
                // InputBMI Area.
                InputBMI(
                    heightController: heightController,
                    weightController: weightController),
                // CalculateButton Area.
                CalculateButton(calculateBMI: calculateBMI),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 3,
        bottom: 16.0,
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(
          bottom: 7,
          top: 7,
        ),
        child: Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 27,
            color: Color(0xff0e1012),
          ),
        ),
      ),
      trailing: SizedBox(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          AppStyle.bmiIcon,
        ),
      ),
    );
  }
}

class Gender extends StatelessWidget {
  final Function(String) selectGender;

  const Gender({Key? key, required this.selectGender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 75, right: 61, top: 94, bottom: 74),
      width: double.infinity,
      height: 111,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 63),
            child: TextButton(
              onPressed: () {
                selectGender('Male');
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                width: 78,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(11),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(39),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset(
                            AppStyle.maleIcon,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                        letterSpacing: 0.17,
                        color: Color(0xff758494),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              selectGender('Female');
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: SizedBox(
              width: 78,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(39),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.asset(
                          AppStyle.femaleIcon,
                          width: 56,
                          height: 56,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                      letterSpacing: 0.17,
                      color: Color(0xff758494),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputBMI extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;

  const InputBMI({
    Key? key,
    required this.heightController,
    required this.weightController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Height',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff2e2f30),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                ),
              ],
              color: const Color(0xffffffff),
            ),
            child: Center(
              child: TextFormField(
                controller: heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff232324),
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your height in cm',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff758494),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Weight',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff2e2f30),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                ),
              ],
              color: const Color(0xffffffff),
            ),
            child: Center(
              child: TextFormField(
                controller: weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff232324),
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your weight in kg',
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff758494),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  final Function() calculateBMI;

  const CalculateButton({Key? key, required this.calculateBMI})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 80),
      child: ElevatedButton(
        onPressed: calculateBMI,
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff2e2f30),
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Calculate BMI',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}

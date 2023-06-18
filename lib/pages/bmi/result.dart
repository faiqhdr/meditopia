import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class BmiResult extends StatelessWidget {
  final double bmi;
  final String category;
  final String gender;
  final double height;
  final double weight;
  final String interpretation;

  const BmiResult({
    Key? key,
    required this.bmi,
    required this.category,
    required this.gender,
    required this.height,
    required this.weight,
    required this.interpretation,
  }) : super(key: key);

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
                const Header(),
                // Gender Area.
                Gender(gender: gender),
                // BMI Status Area.
                BmiStatus(
                  category: category,
                  bmi: bmi,
                  gender: gender,
                  height: height,
                  weight: weight,
                  interpretation: interpretation,
                ),
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
          "BMI Result",
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
  final String gender;

  const Gender({Key? key, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconPath =
        gender == "Female" ? AppStyle.femaleIcon : AppStyle.maleIcon;

    return Container(
      margin: const EdgeInsets.only(left: 150, right: 135, top: 94, bottom: 24),
      width: double.infinity,
      height: 111,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Container(
                width: 78,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.center,
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
                              iconPath,
                              width: 56,
                              height: 56,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        gender == "Female" ? 'Female' : 'Male',
                        style: const TextStyle(
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
          ),
        ],
      ),
    );
  }
}

class BmiStatus extends StatelessWidget {
  final String category;
  final String gender;
  final double height;
  final double bmi;
  final double weight;
  final String interpretation;

  const BmiStatus({
    required this.category,
    required this.bmi,
    required this.gender,
    required this.height,
    required this.weight,
    required this.interpretation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color categoryColor;

    switch (category) {
      case "Underweight":
        categoryColor = Colors.blue;
        break;
      case "Normal weight":
        categoryColor = Colors.green;
        break;
      case "Overweight":
        categoryColor = Colors.orange;
        break;
      case "Obese":
        categoryColor = Colors.red;
        break;
      default:
        categoryColor = Colors.black;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 73),
      padding: const EdgeInsets.fromLTRB(49, 25, 35, 64),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffbecada)),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f6b86b3),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              'BMI for $gender',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
                letterSpacing: 0.14,
                color: Color(0xff758494),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                height: 1.35,
                letterSpacing: 0.17,
                color: categoryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 43,
                fontWeight: FontWeight.w700,
                height: 1.35,
                letterSpacing: 0.17,
                color: Color(0xff758494),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 45, right: 35),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                      letterSpacing: 0.1,
                      color: Color(0xff000000),
                    ),
                    children: [
                      const TextSpan(
                        text: 'Height (cm) ',
                      ),
                      TextSpan(
                        text: height.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                          letterSpacing: 0.1,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                    letterSpacing: 0.1,
                    color: Color(0xff000000),
                  ),
                  children: [
                    const TextSpan(
                      text: 'Weight (kg) ',
                    ),
                    TextSpan(
                      text: weight.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                        letterSpacing: 0.1,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 17, right: 17, top: 25),
            constraints: const BoxConstraints(maxWidth: 263),
            child: Text(
              interpretation,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.32,
                letterSpacing: 0.15,
                color: Color(0xff7b8d9e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

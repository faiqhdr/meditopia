import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditopia/pages/notification_page.dart';
import '../../data/data.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({Key? key}) : super(key: key);

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
              children: const [
                // Header Area.
                Header(),
                // Gender Area.
                Gender(),
                // BMI Status Area.
                BmiStatus(),
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
  const Gender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ),
        ],
      ),
    );
  }
}

class BmiStatus extends StatelessWidget {
  const BmiStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: const Text(
              'BMI for Male',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
                letterSpacing: 0.14,
                color: Color(0xff758494),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const Text(
              'Ideal Weight',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                height: 1.35,
                letterSpacing: 0.17,
                color: Color(0xff58bc5b),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 98),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                      letterSpacing: 0.1,
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Height (cm) ',
                      ),
                      TextSpan(
                        text: '170',
                        style: TextStyle(
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
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                    letterSpacing: 0.1,
                    color: Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: 'Weight (kg) ',
                    ),
                    TextSpan(
                      text: '60',
                      style: TextStyle(
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
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 80),
              width: 280,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xfffa4c4c),
                borderRadius: BorderRadius.circular(76),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xff3dc542),
                    ),
                  ),
                  Container(
                    width: 59,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xffedfb4d),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // bubbleneR (33:742)
            left: 73.2283935547,
            top: 12.2282714844,
            child: Container(
              width: 54,
              height: 54,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 54,
                        height: 54,
                        child: Image.asset(
                          AppStyle.ellipseShape,
                          width: 54,
                          height: 54,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 9.7716064453,
                    top: 10.7717285156,
                    child: Align(
                      child: SizedBox(
                        width: 35,
                        height: 33,
                        child: Image.asset(
                          AppStyle.ellipseShape,
                          width: 35,
                          height: 33,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 22.7716064453,
                    top: 3.7717285156,
                    child: Align(
                      child: SizedBox(
                        width: 9,
                        height: 10,
                        child: Image.asset(
                          AppStyle.triangleShape,
                          width: 9,
                          height: 10,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 16.2716064453,
                    top: 19.7717285156,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          width: 22,
                          height: 13,
                          child: Text(
                            '20.8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                              letterSpacing: 0.3,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
            constraints: const BoxConstraints(maxWidth: 263),
            child: const Text(
              'Ensure calorie intake is in line with daily calorie needs & consume healthy foods',
              style: TextStyle(
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

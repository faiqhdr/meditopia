import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditopia/pages/notification_page.dart';
import '../../data/data.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

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
                // Calendar Area.
                Calendar(),
                // Time Area.
                Time(),
                // Doctor Area.
                Doctor(),
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
          "Schedule",
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
          AppStyle.doctorIcon,
        ),
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 84.62,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(18.73),
            width: 70.46,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1c6ba4),
              borderRadius: BorderRadius.circular(23.9648113251),
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 2.69),
                    child: const Text(
                      '12',
                      style: TextStyle(
                        fontSize: 20.2779178619,
                        fontWeight: FontWeight.w800,
                        height: 1.3499999859,
                        letterSpacing: 0.2027791786,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const Text(
                    'Tue',
                    style: TextStyle(
                      fontSize: 14.7475767136,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1474757671,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(18.73),
            width: 70.46,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffdcedf9),
              borderRadius: BorderRadius.circular(23.9648113251),
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 2.69),
                    child: const Text(
                      '13',
                      style: TextStyle(
                        fontSize: 20.2779178619,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2027791786,
                        color: Color(0xff253141),
                      ),
                    ),
                  ),
                  const Text(
                    'Wed',
                    style: TextStyle(
                      fontSize: 14.7475767136,
                      fontWeight: FontWeight.w600,
                      height: 1.3500000485,
                      letterSpacing: 0.1474757671,
                      color: Color(0xff253141),
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

class Time extends StatelessWidget {
  const Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 27, bottom: 14.64),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10.34),
            child: const Text(
              '12:00 PM',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.14,
                color: Color(0xff7d96b5),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 1),
            width: 280.66,
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xff97abc3),
            ),
          ),
        ],
      ),
    );
  }
}

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16, top: 23.39, right: 23.67, bottom: 17.32),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xf7f1e6ea),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 3.2),
            width: 14.67,
            height: 1.28,
            child: SvgPicture.asset(
              AppStyle.dotsIcon,
              width: 14.67,
              height: 1.28,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 54.33),
            width: double.infinity,
            height: 67.26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 17),
                  width: 60,
                  height: 57.67,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppStyle.hanHyoJoo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 148,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: double.infinity,
                        height: 44.26,
                        child: Stack(
                          children: const [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Align(
                                child: SizedBox(
                                  width: 64,
                                  height: 19,
                                  child: Text(
                                    '11:30 AM',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3499999728,
                                      letterSpacing: 0.14,
                                      color: Color(0xff0c1115),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 18.260717392,
                              child: Align(
                                child: SizedBox(
                                  width: 148,
                                  height: 26,
                                  child: Text(
                                    'Dr. Han Hyo Joo',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3499999799,
                                      letterSpacing: 0.19,
                                      color: Color(0xff0e1012),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Cardiologist',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.35,
                          letterSpacing: 0.15,
                          color: Color(0xa50c1115),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

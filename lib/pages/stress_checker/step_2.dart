import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditopia/pages/notification_page.dart';
import '../../data/data.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class StressLevelCheckerResult extends StatelessWidget {
  final String stressLevel;
  final String mainCauses;
  final String impactOnDailyLife;
  final String copingMechanisms;

  const StressLevelCheckerResult({
    Key? key,
    required this.stressLevel,
    required this.mainCauses,
    required this.impactOnDailyLife,
    required this.copingMechanisms,
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
                Header(),
                // Result Card.
                ResultCard(
                  stressLevel: stressLevel,
                  mainCauses: mainCauses,
                  impactOnDailyLife: impactOnDailyLife,
                  copingMechanisms: copingMechanisms,
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
          "Stress Level Checker",
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
          AppStyle.checkListIcon,
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String stressLevel;
  final String mainCauses;
  final String impactOnDailyLife;
  final String copingMechanisms;

  const ResultCard({
    Key? key,
    required this.stressLevel,
    required this.mainCauses,
    required this.impactOnDailyLife,
    required this.copingMechanisms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stress Level: $stressLevel",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              "Main Causes: $mainCauses",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              "Impact on Daily Life: $impactOnDailyLife",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              "Coping Mechanisms: $copingMechanisms",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

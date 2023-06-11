import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditopia/pages/home_page.dart';
import '../../data/data.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                // User Info here.
                UserInfo(),
                // Logout Button here.
                LogoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 210),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(34.6666660309),
                child: Image.asset(
                  AppStyle.oogwayProfile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 1),
              child: const Text(
                'Master Oogway',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  height: 1.4,
                  color: AppStyle.primarySwatch,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 39),
              child: const Text(
                'oogway@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.8461538462,
                  color: AppStyle.primarySwatch,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 1, right: 1),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xff1c6ba4),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Center(
            child: Text(
              'Logout',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.3,
                letterSpacing: 0.42,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

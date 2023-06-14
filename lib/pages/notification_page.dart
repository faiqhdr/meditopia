import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../size_config.dart';
import '../style/style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

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
            child: const Column(
              children: [
                // Header Area.
                Header(),
                // Message Area.
                Message(),
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
          "Notifications",
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
          AppStyle.notificationsIcon,
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 17, top: 22, right: 54, bottom: 22),
      width: double.infinity,
      height: 100,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.27),
            padding: const EdgeInsets.only(
                left: 16.59, top: 15.56, right: 17.73, bottom: 15.56),
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffdcedf9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SizedBox(
                width: 22.4,
                height: 24.89,
                child: SvgPicture.asset(
                  AppStyle.messageIcon,
                  width: 22.4,
                  height: 24.89,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 5),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    '3 Schedules!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.16,
                      color: Color(0xff0e1012),
                    ),
                  ),
                ),
                const Text(
                  'Check your schedule Today',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.14,
                    color: Color(0xff7b8d9e),
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

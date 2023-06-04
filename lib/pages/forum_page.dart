import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../data/data.dart';
import '../size_config.dart';
import '../style/style.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({Key? key}) : super(key: key);

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
                // Forum List.
                Post(),
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
          "Forum",
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
          AppStyle.reportIcon,
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14.55),
      padding: const EdgeInsets.fromLTRB(18, 23.02, 23.67, 21.45),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xf7f1e6ea),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 3.24),
            width: 14.67,
            height: 1.28,
            child: SvgPicture.asset(
              AppStyle.dotsIcon,
              width: 14.67,
              height: 1.28,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 27.33),
            padding: const EdgeInsets.only(right: 14),
            width: double.infinity,
            height: 63.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 60,
                  height: 57.67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffffffff),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0.45),
                  width: 161,
                  child: Stack(
                    children: const [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 139,
                            height: 19,
                            child: Text(
                              '23 Likes | 0 Comment',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.35,
                                letterSpacing: 0.14,
                                color: Color(0xff0c1115),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 44,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 115,
                            height: 19,
                            child: Text(
                              'by Jimmy Neutron',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.35,
                                letterSpacing: 0.14,
                                color: Color(0xff0c1115),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 18.55,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 161,
                            height: 26,
                            child: Text(
                              'Banana’s Benefits',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                height: 1.35,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

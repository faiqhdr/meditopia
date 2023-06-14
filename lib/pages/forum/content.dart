import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

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
                // Content Post Area.
                ContentPost(),
                // Comment Area.
                Comment(),
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

class ContentPost extends StatelessWidget {
  const ContentPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xf7f1e6ea),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5.67),
            width: 14.67,
            height: 1.24,
            child: Image.network(
              'https://img.buzzfeed.com/buzzfeed-static/static/2018-08/9/13/asset/buzzfeed-prod-web-06/sub-buzz-12334-1533837176-2.jpg',
              width: 14.67,
              height: 1.24,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 17),
            width: double.infinity,
            height: 107,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Align(
                    child: SizedBox(
                      width: 87,
                      height: 81,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 103,
                  top: 33,
                  child: Align(
                    child: SizedBox(
                      width: 102,
                      height: 49,
                      child: Text(
                        'by Jimmy Neutron \n24/05/2023\n12 Likes',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.35,
                          letterSpacing: 0.12,
                          color: Color(0xff0c1115),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 102,
                  top: 5,
                  child: Align(
                    child: SizedBox(
                      width: 170,
                      height: 27,
                      child: Text(
                        'Banana’s Benefits',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                          letterSpacing: 0.2,
                          color: Color(0xff0e1012),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 1,
                  top: 74,
                  child: Align(
                    child: SizedBox(
                      width: 350,
                      height: 33,
                      child: Text(
                        '______________________________',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                          letterSpacing: 0.24,
                          color: Color(0xff0e1012),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 2, left: 2),
            constraints: const BoxConstraints(
              maxWidth: 370,
            ),
            child: const Text(
              'Bananas are incredibly healthy, convenient, delicious, and one of the most inexpensive fresh fruits you can buy. This makes them an excellent choice for anyone interested in eating healthy.\nWhile they’re native to Southeast Asia, they grow ubiquitously in many warm climates, making them available worldwide. The Cavendish variety, the most common type found in grocery stores, starts out firm and green but turns yellow, soft, and sweet as it ripens.\nBananas contain many essential nutrients and may benefit weight loss, digestion, and heart health.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
                letterSpacing: 0.14,
                color: Color(0xff0c1115),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xfffff3c6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            child: const Text(
              '1 Comment',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.35,
                letterSpacing: 0.1,
                color: Color(0xff0c1115),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                  letterSpacing: 0.1,
                  color: Color(0xff0c1115),
                ),
                children: [
                  TextSpan(text: 'Timmy '),
                  TextSpan(
                    text: 'on 25/05/2024',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                      letterSpacing: 0.1,
                      color: Color(0xff0c1115),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Very nice!',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.35,
              letterSpacing: 0.1,
              color: Color(0xff0c1115),
            ),
          ),
        ],
      ),
    );
  }
}

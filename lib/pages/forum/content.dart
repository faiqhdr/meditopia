import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import '../../size_config.dart';
import '../../style/style.dart';

class ContentPage extends StatelessWidget {
  final String postId;

  const ContentPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('post').doc(postId).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final post = snapshot.data!;

          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 17,
                ),
                child: Column(
                  children: [
                    // Header Area.
                    Header(),
                    // Content Post Area.
                    ContentPost(post: post),
                    // Comment Area.
                    Comment(post: post),
                  ],
                ),
              ),
            ],
          );
        },
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
  final DocumentSnapshot post;

  const ContentPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final author = post['author'];
    final timestamp = (post['timestamp'] as Timestamp).toDate();
    final like = post['like'];
    final title = post['title'];
    final content = post['content'];

    // Format the timestamp using DateFormat
    final formattedTimestamp =
        DateFormat("MMM dd, yyyy 'at' hh:mm:ss a").format(timestamp);

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
                Positioned(
                  left: 103,
                  top: 33,
                  child: Align(
                    child: SizedBox(
                      width: 400,
                      height: 49,
                      child: Text(
                        '$author\n$formattedTimestamp\n$like',
                        style: const TextStyle(
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
                Positioned(
                  left: 102,
                  top: 5,
                  child: Align(
                    child: SizedBox(
                      width: 170,
                      height: 27,
                      child: Text(
                        title,
                        style: const TextStyle(
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
            child: Text(
              content,
              style: const TextStyle(
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
  final DocumentSnapshot post;

  const Comment({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentCount = post['commentCount'];
    final comment = post['comment'];

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
          Text(
            'Comments ($commentCount)',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1.35,
              letterSpacing: 0.17,
              color: Color(0xff0e1012),
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: List.generate(comment.length, (index) {
              final commenter = comment[index]['commenter'];
              final commentText = comment[index]['commentText'];
              final commentTimestamp = DateTime.fromMillisecondsSinceEpoch(
                  comment[index]['commentTimestamp']);
              final formattedCommentTimestamp =
                  DateFormat("MMM dd, yyyy 'at' hh:mm:ss a")
                      .format(commentTimestamp);

              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$commenter - $formattedCommentTimestamp',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.35,
                        letterSpacing: 0.12,
                        color: Color(0xff0c1115),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      commentText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.35,
                        letterSpacing: 0.14,
                        color: Color(0xff0c1115),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

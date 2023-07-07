import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import '../../style/style.dart';
import 'content.dart';
import 'create.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'edit.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({Key? key}) : super(key: key);

  void _deletePost(BuildContext context, String postId) {
    FirebaseFirestore.instance.collection('post').doc(postId).delete();

    // Show confirmation alert
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Post Deleted'),
          content: const Text('The post has been deleted.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
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
                // Forum List.
                PostList(
                  onDeletePost: (postId) => _deletePost(context, postId),
                ),
                // Create Button List.
                CreateButton(),
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

class PostList extends StatelessWidget {
  const PostList({Key? key, required this.onDeletePost}) : super(key: key);
  final Function(String) onDeletePost;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final posts = snapshot.data!.docs;

          return Column(
            children: posts.map((post) {
              final data = post.data() as Map<String, dynamic>;
              final commentCount = data['commentCount'] ?? 0;
              final title = data['title'] ?? '';
              final author = data['author'] ?? '';
              final postId = post.id; // Add this line to get the post ID

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContentPage(postId: postId)),
                  );
                },
                child: Container(
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
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        width: 139,
                                        height: 19,
                                        child: Text(
                                          '$commentCount Likes | $commentCount Comment',
                                          style: const TextStyle(
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
                                          'by $author',
                                          style: const TextStyle(
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
                                          title,
                                          style: const TextStyle(
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
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditPost(postId: postId),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: const Color(0xff1c6ba4),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.42,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                child: const Text('Edit'),
                              ),
                            ),
                            const SizedBox(width: 11),
                            SizedBox(
                              width: 105,
                              child: ElevatedButton(
                                onPressed: () {
                                  onDeletePost(postId);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: const Color(0xff1c6ba4),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.42,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                child: const Text('Delete'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }

        return const SizedBox(); // Return an empty container if there's no data yet
      },
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 17, right: 17),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePost()),
              );
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xf7f1e6ea),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'Create Post',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.42,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

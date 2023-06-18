import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../size_config.dart';
import '../../style/style.dart';
import 'view.dart';

class CreatePost extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  CreatePost({Key? key}) : super(key: key);

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
                // Content Area.
                Content(
                  titleController: titleController,
                  contentController: contentController,
                ),
                // Post Button Area.
                PostButton(
                  titleController: titleController,
                  contentController: contentController,
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

class Content extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const Content({
    Key? key,
    required this.titleController,
    required this.contentController,
  }) : super(key: key);

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
                      child: AuthorInfo(),
                    ),
                  ),
                ),
                Positioned(
                  left: 102,
                  top: 8,
                  child: Align(
                    child: SizedBox(
                      width: 500,
                      height: 27,
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: 'Enter title...',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.35,
                            letterSpacing: 0.2,
                            color: Color(0xff0e1012),
                          ),
                          border: InputBorder.none,
                        ),
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
            child: TextField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: 'Enter content...',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                  letterSpacing: 0.14,
                  color: Color(0xff0c1115),
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
                letterSpacing: 0.14,
                color: Color(0xff0c1115),
              ),
              maxLines: null, // Allow multiple lines in the TextField
              keyboardType: TextInputType.multiline, // Enable multiline input
              textInputAction: TextInputAction
                  .newline, // Change the keyboard's Enter button to a newline button
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return FutureBuilder<DocumentSnapshot>(
      future: firestore.collection('users').doc(user!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Error fetching user data'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return const Center(
            child: Text('No user data found'),
          );
        }

        var userData = snapshot.data!.data() as Map<String, dynamic>?;

        return Text(
          'by ${userData?['fullName']}',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.35,
            letterSpacing: 0.12,
            color: Color(0xff0c1115),
          ),
        );
      },
    );
  }
}

class PostButton extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const PostButton({
    Key? key,
    required this.titleController,
    required this.contentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 80),
      child: ElevatedButton(
        onPressed: () {
          // Handle post button press
          _postContentToFirestore(context);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff2e2f30),
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Post',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }

  void _postContentToFirestore(BuildContext context) async {
    // Get the current user's ID
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userID = user.uid;

      // Generate a unique document ID for the post
      String postID = FirebaseFirestore.instance.collection('post').doc().id;

      // Get the current date and time
      DateTime now = DateTime.now();

      // Create a new post document in the 'post' collection
      await FirebaseFirestore.instance.collection('post').doc(postID).set({
        'author': userID,
        'title': titleController.text,
        'content': contentController.text,
        'like': 0,
        'commentCount': 0,
        'comment': '',
        'timestamp': now,
      }).then((value) {
        // Post created successfully
        print('Post created successfully!');
        // Navigate to the forum page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForumPage()));
      }).catchError((error) {
        // An error occurred while creating the post
        print('Error creating post: $error');
      });
    }
  }
}

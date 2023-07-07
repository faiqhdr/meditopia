import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPost extends StatelessWidget {
  final String postId;

  const EditPost({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('post').doc(postId).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            var title = data['title'] ?? '';
            var content = data['content'] ?? '';

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: title,
                    decoration: const InputDecoration(labelText: 'Title'),
                    onChanged: (value) => title = value, // Update the title
                  ),
                  TextFormField(
                    initialValue: content,
                    decoration: const InputDecoration(labelText: 'Content'),
                    maxLines: null, // Allow multiple lines
                    onChanged: (value) => content = value, // Update the content
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle save button press
                      _updatePost(context, title, content);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _updatePost(BuildContext context, String title, String content) {
    // Update the post in Firestore
    FirebaseFirestore.instance.collection('post').doc(postId).update({
      'title': title,
      'content': content,
    }).then((value) {
      // Post updated successfully
      print('Post updated successfully!');
      Navigator.pop(
          context); // Close the edit page and go back to the previous screen
    }).catchError((error) {
      // An error occurred while updating the post
      print('Error updating post: $error');
    });
  }
}

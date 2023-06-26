import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/bottom_bar.dart';
import '../../size_config.dart';
import '../../style/style.dart';

class ConfirmationPage extends StatelessWidget {
  final String doctorName;
  final String specialist;
  final String date;
  final String time;

  const ConfirmationPage({
    required this.doctorName,
    required this.specialist,
    required this.date,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Retrieve the currently logged-in user's ID
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = currentUser?.uid ?? '';

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
                const Header(),
                // Booking Details.
                BookingDetails(
                  doctorName: doctorName,
                  specialist: specialist,
                  date: date,
                  time: time,
                ),
                // Proceed Button.
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showSuccessAlert(context);

                      // Save the booking data to Firestore under the user's ID
                      saveBookingData(
                          userId, doctorName, specialist, date, time);
                    },
                    child: const Text('Proceed'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8.0),
              Text('Success'),
            ],
          ),
          content: const Text('Booking confirmed!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog.
                // Navigate back to the BottomBar screen.
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomBar()),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void saveBookingData(
    String userId,
    String doctorName,
    String specialist,
    String date,
    String time,
  ) {
    FirebaseFirestore.instance
        .collection('bookings')
        .doc(userId)
        .set({
          'doctorName': doctorName,
          'specialist': specialist,
          'date': date,
          'time': time,
        })
        .then((value) => print('Booking data saved'))
        .catchError((error) => print('Failed to save booking data: $error'));
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

class BookingDetails extends StatelessWidget {
  final String doctorName;
  final String specialist;
  final String date;
  final String time;

  const BookingDetails({
    required this.doctorName,
    required this.specialist,
    required this.date,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Doctor: $doctorName'),
        Text('Specialist: $specialist'),
        Text('Date: $date'),
        Text('Time: $time'),
      ],
    );
  }
}

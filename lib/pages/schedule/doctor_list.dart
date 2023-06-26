import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../size_config.dart';
import '../../style/style.dart';
import 'confirm.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the currently logged-in user's ID
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = currentUser?.uid ?? '';
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
                // Calendar Area.
                Calendar(),
                // Time Area.
                Time(),
                // Doctor Area.
                Doctor(),
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

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = currentUser?.uid ?? '';

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final doctors = snapshot.data!.docs;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index].data() as Map<String, dynamic>;
              final name = doctor['name'] ?? '';
              final schedule = doctor['schedule'] ?? [];
              final specialist = doctor['specialist'] ?? '';

              return ListTile(
                title: Text(name),
                subtitle: Text(specialist),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select available date and time:'),
                        content: SingleChildScrollView(
                          child: AvailableScheduleList(
                            schedule: schedule,
                            doctorName: name,
                            specialist: specialist,
                            userId: userId,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog.
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Error fetching data');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class AvailableScheduleList extends StatelessWidget {
  final List<dynamic> schedule;
  final String doctorName;
  final String specialist;
  final String userId;

  const AvailableScheduleList({
    required this.schedule,
    required this.doctorName,
    required this.specialist,
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(schedule.length, (index) {
        final scheduleItem = schedule[index];
        final timestamp = scheduleItem as Timestamp; // Cast to Timestamp
        final dateTime = timestamp.toDate();
        final date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
        final time = '${dateTime.hour}:${dateTime.minute}';

        return ListTile(
          title: Text(date),
          subtitle: Text(time),
          onTap: () {
            saveBookingData(userId, doctorName, specialist, date, time);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmationPage(
                  doctorName: doctorName,
                  specialist: specialist,
                  date: date,
                  time: time,
                ),
              ),
            );
          },
        );
      }),
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

class Time extends StatelessWidget {
  const Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement your time widget here.
    return Container();
  }
}

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement your doctor widget here.
    return Container();
  }
}

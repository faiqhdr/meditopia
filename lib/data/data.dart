import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meditopia/pages/bmi/view.dart';
import '../pages/schedule/doctor_list.dart';
import '../pages/stress_checker/step_1.dart';

class ServiceItem {
  final String image;
  final Color color;
  final Widget? route;

  ServiceItem({
    required this.image,
    required this.color,
    this.route,
  });
}

List<ServiceItem> servicesList = [
  ServiceItem(
    image: 'assets/icons/doctor-Icon.svg',
    color: const Color(0xffDCEDF9),
    route: const DoctorList(),
  ),
  ServiceItem(
    image: 'assets/icons/noun-medical-test.svg',
    color: const Color(0xffFAF0DB),
    route: StressLevelChecker(),
  ),
  ServiceItem(
    image: 'assets/icons/bmi-Icon.svg',
    color: const Color(0xffF2E3E9),
    route: const BmiCalculator(),
  ),
];

class AppointmentItem {
  final String date;
  final String time;
  final String title;
  final String subTitle;
  final Color color;

  AppointmentItem({
    required this.date,
    required this.time,
    required this.title,
    required this.subTitle,
    required this.color,
  });
}

List<AppointmentItem> upcomingAppointmentsList = [
  AppointmentItem(
    date: "12\nTue",
    time: DateFormat('hh:mm a').format(DateTime.now()),
    title: "Dr. Kim Sabu",
    subTitle: "Depression",
    color: const Color(0xff1C6BA4),
  ),
  AppointmentItem(
    date: "16\nSat",
    time: DateFormat('hh:mm a').format(DateTime.now()),
    title: "Dr. Cha Eun Jae",
    subTitle: "Cardiology",
    color: const Color(0xff1C6BA4),
  ),
];

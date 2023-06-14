import 'package:flutter/material.dart';
// cimport 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meditopia/pages/account/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final List<FirebaseApp> apps = await Firebase.apps;

  if (apps.isEmpty) {
    print('Firebase is not connected.');
  } else {
    print('Firebase is connected.');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditopia',
      home: LoginPage(),
    );
  }
}

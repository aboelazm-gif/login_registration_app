import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_registration_app/firebase_options.dart';
import 'package:login_registration_app/screens/_introPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

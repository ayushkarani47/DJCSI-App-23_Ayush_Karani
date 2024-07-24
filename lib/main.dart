import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:focuslist/auth/login_page.dart';
import 'package:flutter/services.dart';
import 'package:focuslist/firebase_options.dart';
import 'package:focuslist/screens/startpage.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 228, 140, 33),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 225, 225, 225)),
        useMaterial3: true,
      ),
     home:  LoginPage(),
    );
  }
}




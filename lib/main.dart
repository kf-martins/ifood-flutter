
import 'package:flutter/material.dart';
import 'package:ifood/Forms/LoginForm.dart';
import 'package:ifood/Forms/SingupForm.dart';
import 'package:ifood/Pages/HomePage.dart';
// import 'package:ifood/Pages/HomePage.old.dart';
import 'package:ifood/Pages/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFOOD',
      initialRoute: '/homePage',
      routes: {
        '/': (context) => const MainPage(),
        '/login': (context) => const LoginForm(),
        '/singup': (context) => const SingupForm(),
        '/homePage': (context) => const HomePage(),
      }, 

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
    );
  }
}


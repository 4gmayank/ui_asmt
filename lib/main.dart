import 'package:flutter/material.dart';
import 'package:zip_loan/feature/presentation/login_module/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zip Loan',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}



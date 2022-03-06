import 'package:flutter/material.dart';
import 'package:zip_loan/core/utils/app_routes.dart';
import 'package:zip_loan/feature/presentation/login_module/splash_screen/splash_screen.dart';

import 'core/config/localization.dart';
import 'feature/presentation/login_module/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zip Loan',
      localizationsDelegates: const [
        MyLocalizationsDelegate(),
      ],
      debugShowCheckedModeBanner: false,
      routes: _registerRoutes(),
      initialRoute: AppRoutes.splash,
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{


      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.login_screen: (context) => const LoginScreen(),
      // AppRoutes.personal_detail_screen : (context)=> PersonalDetailScreen(),
      // AppRoutes.business_detail_screen : (context)=> BusinessDetailScreen(),
      // AppRoutes.seek_loan_screen : (context)=> SeekLoanScreen(),

    };
  }
}



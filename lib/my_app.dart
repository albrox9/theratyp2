import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/forgot_password.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view.dart';
import 'package:theratyp/ui/pages/initial_screens/sign_in.dart';
import 'package:theratyp/ui/pages/initial_screens/sign_up.dart';
import 'package:theratyp/ui/pages/initial_screens/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_view',
      routes: {
        '/splash_view': (context) => const SplashView(),
        '/login_view': (context) => LoginView(),
        '/sign_up': (context) => SignUp(),
        '/home_view': (context) => const HomeView(),
        '/forgot_password': (context) => const ForgotPassword(),
      },
    );
  }
}

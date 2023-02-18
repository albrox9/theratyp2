import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/login_view/login_view.dart';
import 'package:theratyp/ui/pages/splash_view.dart';

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
      home: LoginView(),
      debugShowCheckedModeBanner: false,

      /*title: 'Welcome to The Adventurer',
      initialRoute: '/login_view',
      routes: {
        '/splash_view': (context) => const SplashView(),
        '/login_view': (context) => const LoginView(),
        '/home_view': (context) => const HomeView(),
      },*/
    );
  }
}

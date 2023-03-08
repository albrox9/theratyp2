import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/forgot_password.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view/home_view.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view/widget/video_player.dart';
import 'package:theratyp/ui/pages/initial_screens/sign_in.dart';
import 'package:theratyp/ui/pages/initial_screens/sign_up.dart';
import 'package:theratyp/ui/pages/initial_screens/splash_view.dart';
import 'package:theratyp/ui/pages/user_screen/drawer_view.dart';
import 'package:theratyp/ui/pages/user_screen/edit_profile.dart';

import 'data/data_holder.dart';

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
      initialRoute: DataHolder().auth.currentUser == null ? '/login_view' : '/splash_view',
      routes: {
        '/splash_view': (context) => const SplashView(),
        '/login_view': (context) => LoginView(),
        '/sign_up': (context) => SignUp(),
        '/home_view': (context) => HomeView(),
        '/forgot_password': (context) => ForgotPassword(),
        '/edit_profile':(context)=>EditProfile(),
        '/drawer_view': (context)=> const DrawerView(),

      }
    );
  }
}

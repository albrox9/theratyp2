import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/forgot_password.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/button_google.dart';
import 'package:theratyp/ui/widget/button.dart';

import '../../widget/input_text.dart';
import 'sign_up.dart';

class LoginView extends StatelessWidget {
  final userController = TextEditingController();
  final userPassword = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              child: BackgroundImage(
                url: 'assets/images/login.png',
              ),
            ),
            const Flexible(
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            InputText(
              controller: userController,
              shintText: 'Email',
              bObscureText: false,
              icon: Icons.alternate_email,
            ),
            InputText(
              controller: userPassword,
              shintText: 'Password',
              bObscureText: true,
              icon: Icons.lock,
            ),
            Button(
              onTap: () {
                //TODO VER SI HAY QUE CAMBIAR RUTA HACIA LA HOME
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
              }, name: 'Sign In',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
              },
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Forgot Password? ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'Reset Here', style: TextStyle(color: Colors.green)),
              ])),
            ),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            ButtonGoogle(
              onTap: () {
                //TODO IMPLEMENTAR LA RUTA DE GOOGLE
              }, name: 'Sign In with Google',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'New to TheraTyp? ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'Register now',
                    style: TextStyle(color: Colors.green)),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}

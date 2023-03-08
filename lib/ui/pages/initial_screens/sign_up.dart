import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theratyp/data/auth/admin_data.dart';
import 'package:theratyp/data/data_holder.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/button_google.dart';

import '../../widget/button.dart';
import '../../widget/input_text.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
                child: BackgroundImage(
              url: 'assets/images/onboarding5.jpg',
            )),
            const Flexible(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Form(
              key: DataHolder().keyForm,
              child: Column(
                children: [
                  InputText(
                    controller: emailController,
                    shintText: 'Enter Email',
                    bObscureText: false,
                    icon: Icons.alternate_email,
                  ),
                  InputText(
                    controller: passwordController,
                    shintText: 'Enter Password',
                    bObscureText: true,
                    icon: Icons.lock,
                  ),
                  InputText(
                    controller: passwordController2,
                    shintText: 'Confirm Password',
                    bObscureText: true,
                    icon: Icons.lock,
                  ),
                ],
              ),
            ),
            Button(
              onTap: () {
                //Compruebo que las contraseñas sean iguales. Si lo son se hace registro y si no se muestra un banner.
                if (passwordController.text == passwordController2.text) {
                  AdminData().signUp(
                      emailController.text, passwordController.text, context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "Password are not equal",
                    style: TextStyle(fontSize: 16),
                  )));
                }
              },
              name: 'Sign Up',
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
                //Te lleva directamente a la home porque crea el perfil de forma automática.
                AdminData().signInWithGoogle().then((value){
                  AdminData().insertProfile(value.user!.displayName.toString(), 0, ' ', ' ', value.user!.photoURL.toString(), context);
                });
                Navigator.of(context).popAndPushNamed('/home_view');
              },
              name: 'Sign Up with Google',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Have an Account? ',
                    style: TextStyle(color: Colors.black)),
                TextSpan(text: 'Login', style: TextStyle(color: Colors.green)), //Te lleva a la Login.
              ])),
            ),
          ],
        ),
      ),
    );
  }
}

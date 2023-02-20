import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/button_google.dart';

import '../../widget/button.dart';
import '../../widget/input_text.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
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
              const Flexible(child: BackgroundImage(url: 'assets/images/onboarding5.jpg',)),
              const Flexible(child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),),
              InputText(
                controller: userNameController,
                shintText: 'Enter Username',
                bObscureText: false,
                icon: Icons.person_3,
              ),
              InputText(
                controller: phoneNumberController,
                shintText: 'Enter Phone Number',
                bObscureText: true,
                icon: Icons.phone_android,
              ),
              InputText(
                controller: emailController,
                shintText: 'Enter Email',
                bObscureText: false,
                icon: Icons.alternate_email,
              ),
              InputText(
                controller: passwordController,
                shintText: 'Password',
                bObscureText: true,
                icon: Icons.lock,
              ),
              Button(
                onTap: () {
                  //TODO IMPLEMENTAR LA RUTA PORQUE NO SE A DONDE VA
                }, name: 'Sign Up',
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
                  //TODO IMPLEMENTAR LA RUTA PORQUE NO SE A DONDE VA
                }, name: 'Sign Up with Google',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Have an Account? ',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: 'Login', style: TextStyle(color: Colors.green)),
                ])),
              ),
            ],
          ),
        ),
    );
  }
}


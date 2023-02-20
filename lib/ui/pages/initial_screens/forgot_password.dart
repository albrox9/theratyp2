import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import '../../widget/button.dart';
import '../../widget/input_text.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fpassController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              child: BackgroundImage(url: 'assets/images/forgot.png',),
            ),
            const Flexible(
              child: Text(
                'Forgot\nPassword',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            InputText(
              controller: fpassController ,
              shintText: 'Enter Email',
              bObscureText: true,
              icon: Icons.alternate_email,
            ),
            Button(
              onTap: () {
                //TODO IMPLEMENTAR LA RUTA PORQUE NO SE A DONDE VA
              }, name: 'Reset Password',
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed('/sign_up');
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


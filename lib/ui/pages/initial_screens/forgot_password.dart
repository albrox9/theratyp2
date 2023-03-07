import 'package:flutter/material.dart';
import 'package:theratyp/data/auth/admin_data.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import '../../widget/button.dart';
import '../../widget/input_text.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final fpassController = TextEditingController();

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
                url: 'assets/images/forgot.png',
              ),
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
              controller: fpassController,
              shintText: 'Enter Email',
              bObscureText: false,
              icon: Icons.alternate_email,
            ),
            Button(
              onTap: () {
                AdminData()
                    .resetPassword(fpassController.text)
                    .then((value) => {
                          if (value == null)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Email reset send'))),
                              Navigator.of(context)
                                  .popAndPushNamed('/login_view')
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(value))),
                            }
                        });
              },
              name: 'Reset Password',
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

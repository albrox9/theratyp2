import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/home_view.dart';
import 'package:theratyp/ui/pages/login_view/components/background_image.dart';
import 'package:theratyp/ui/pages/login_view/components/button_google.dart';
import 'package:theratyp/ui/widget/button.dart';

import '../../widget/input_text.dart';

class LoginView extends StatelessWidget {
  final userController = TextEditingController();
  final userPassword = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              child: BackgroundImage(),
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
              shintText: 'Username',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
            ),
            GestureDetector(
              onTap: () {
                //TODO: NAVIGATOR PANTALLA FORGOT PASSWORD
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

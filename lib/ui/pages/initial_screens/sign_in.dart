import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/forgot_password.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/button_google.dart';
import 'package:theratyp/ui/widget/button.dart';

import '../../../data/auth/admin_data.dart';
import '../../widget/input_text.dart';
import 'sign_up.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final userController = TextEditingController();
  final userPassword = TextEditingController();


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
                AdminData()
                    .singIn(userController.text, userPassword.text, context)
                    .then((result) async => {
                          if (result == null)
                            {
                              if (await AdminData().isGetProfile())
                                {
                                  Navigator.of(context)
                                      .popAndPushNamed("/home_view")
                                }
                              else
                                {
                                  Navigator.of(context)
                                      .popAndPushNamed("/edit_profile")
                                }
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                result,
                                style: TextStyle(fontSize: 16),
                              )))
                            }
                        });
              },
              name: 'Sign In',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
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
               AdminData().signInWithGoogle().then((value){
                 AdminData().insertProfile(value.user!.displayName.toString(), 0, ' ', ' ', value.user!.photoURL.toString(), context);
               });
               Navigator.of(context).popAndPushNamed('/home_view');

              },
              name: 'Sign In with Google',
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

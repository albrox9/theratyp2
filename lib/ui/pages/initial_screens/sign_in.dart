import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:theratyp/ui/pages/initial_screens/forgot_password.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view/home_view.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/background_image.dart';
import 'package:theratyp/ui/pages/initial_screens/widget_initial/button_google.dart';
import 'package:theratyp/ui/widget/button.dart';

import '../../../data/auth/admin_data.dart';
import '../../../data/data_holder.dart';
import '../../widget/input_text.dart';
import 'sign_up.dart';

class LoginView extends StatelessWidget {


  LoginView({Key? key}) : super(key: key);

  final userController = TextEditingController();
  final userPassword = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {

    String? username;

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

                AdminData()
                    .singIn(userController.text, userPassword.text, context)
                    .then((result) async => {
                          if (result == null){

                              if(await AdminData().isGetProfile()){
                                Navigator.of(context).popAndPushNamed("/home_view")
                              } else {
                                Navigator.of(context).popAndPushNamed("/edit_profile")
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ForgotPassword()));
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
                _googleSignIn.signIn().then((value){
                  Navigator.of(context).popAndPushNamed('/profile_view');
                  print(value?.email);

                });

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

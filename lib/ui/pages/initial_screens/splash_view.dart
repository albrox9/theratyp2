import 'package:flutter/material.dart';

import '../../../data/auth/admin_data.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _State();
}

class _State extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    loadData();
    super.initState();
  }

  void loadData() async {
    //Función en la que vamos a cargar todos los recursos necesarios (aunque hay cosas que se cargan antes)
    await Future.delayed(const Duration(seconds: 2));

    bool pExist = await AdminData().isGetProfile();

    if (pExist) {
      setState(() {
        Navigator.of(context).popAndPushNamed("/home_view");
      });
    } else {
      setState(() {
        Navigator.of(context).popAndPushNamed("/edit_profile");
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text("Welcome to Theratyp!",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                  const Image(
                    image: AssetImage('assets/images/onboarding4.png'),
                  ),
                  const Text("Just breath...",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                  CircularProgressIndicator(
                    value: controller.value,
                    color: Colors.orange,
                  ),
                ])));
  }
}

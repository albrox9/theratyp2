import 'package:flutter/material.dart';

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
    super.initState();
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
                  const Image(
                    image: AssetImage('assets/images/onboarding4.png'),
                  ),
                  const Text("Just breath...",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 23,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                  CircularProgressIndicator(
                    value: controller.value,
                    color: Colors.orange,
                  ),
                ]
            )
        )
    );
  }
}

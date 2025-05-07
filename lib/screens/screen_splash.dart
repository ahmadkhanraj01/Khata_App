import 'package:flutter/material.dart';
import 'package:khata_app/screens/screen_auth_dashboard.dart';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => const ScreenAuthDashboard()),
              (Route<dynamic> route) => false);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0443FF),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: const Image(image: AssetImage('assets/icon/icon.png')),
        ),
      ),
    );
  }
}

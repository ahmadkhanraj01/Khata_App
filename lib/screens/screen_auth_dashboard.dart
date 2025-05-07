import 'package:flutter/material.dart';
import 'package:khata_app/screens/auth/screen_login.dart';
import 'auth/screen_phone_auth.dart';
import 'auth/screen_signup.dart';
import 'package:khata_app/theme_data/drawer_material.dart';

class ScreenAuthDashboard extends StatefulWidget {
  const ScreenAuthDashboard({super.key});

  @override
  State<ScreenAuthDashboard> createState() => _ScreenAuthDashboardState();
}

class _ScreenAuthDashboardState extends State<ScreenAuthDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMaterial(),
      appBar: AppBar(
        title: const Text("Auth Dashboard"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              height: 300,
              width: 300,
              child: const Image(image: AssetImage('assets/icon/logoT.png')),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const ScreenLogin()));
                    },
                    child: const Text("Login with Email")),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const ScreenSignUp()));
                    },
                    child: const Text("Sign up")),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const ScreenPhoneAuth()));
                    },
                    child: const Text("Phone Auth")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:khata_app/screens/screen_account_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: const Image(image: AssetImage('assets/icon/logoT.png')),
            ),
            TextFormField(
              controller: controllerEmail,  // Added controller here
              decoration: const InputDecoration(hintText: "Enter Email"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controllerPassword,  // Added controller here
              decoration: const InputDecoration(hintText: "Enter Password"),
              obscureText: true,  // Hides password text for security
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = controllerEmail.text.trim();
                String password = controllerPassword.text.trim();

                FirebaseAuth.instance
                    .signInWithEmailAndPassword(email: email, password: password)
                    .then((onValue) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => const ScreenAccountList()),
                  );
                  print(onValue);
                }).catchError((error) {
                  print("Login failed: $error");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login failed. Please try again.")),
                  );
                });
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}

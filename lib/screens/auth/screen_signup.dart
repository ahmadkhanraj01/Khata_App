import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: const Image(image: AssetImage('assets/icon/logoT.png'))),
            TextFormField(
              controller: controllerEmail,
              decoration: const InputDecoration(hintText: "Enter Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controllerPassword,
              decoration: const InputDecoration(hintText: "Enter Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              String email = controllerEmail.text.toString();
              String password = controllerPassword.text.toString();
              FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((onValue) {
                print(onValue);
              });
              Navigator.pop(context);
            }, child: const Text("Sign In"))
          ],
        ),
      ),
    );
  }
}

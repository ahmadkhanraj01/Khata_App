import 'package:flutter/material.dart';
import 'package:khata_app/screens/auth/screen_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ScreenPhoneAuth extends StatefulWidget {
  const ScreenPhoneAuth({super.key});

  @override
  State<ScreenPhoneAuth> createState() => _ScreenPhoneAuthState();
}

class _ScreenPhoneAuthState extends State<ScreenPhoneAuth> {
  final phoneController = TextEditingController();
  String? myVerificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Auth"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: const Image(image: AssetImage('assets/icon/logoT.png'))),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: "Enter phone number"
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              String phoneNumber = phoneController.text.toString();
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: phoneNumber,
                verificationCompleted: (PhoneAuthCredential credential) {
                  setState(() {});
                  print('object\n\n\n\n\n ${credential.smsCode}');
                },
                verificationFailed: (FirebaseAuthException e) {
                  print('Errorn\n\n\n\n\n ${e.toString()}');
                },
                codeSent: (String verificationId, forceResendingToken) {
                  myVerificationId = verificationId;
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>ScreenOTP(number: phoneController.toString(), myVerificationId: myVerificationId.toString())));
                  print(
                      'verification id\n\n\n\n\n\n\n ${verificationId.toString()}');
                },
                codeAutoRetrievalTimeout: (String verificationId) {
                  print(
                      'AUTO RETRIEVAL TIME OUT ${verificationId.toString()}');
                },
              );

            }, child: const Text("Get OTP")),
          ],
        ),
      ),
    );
  }
}

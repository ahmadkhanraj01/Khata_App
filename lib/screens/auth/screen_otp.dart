import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khata_app/screens/screen_account_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenOTP extends StatefulWidget {
  final String number;
  final String myVerificationId;

  const ScreenOTP({super.key, required this.number, required this.myVerificationId});

  @override
  State<ScreenOTP> createState() => _ScreenOTPState();
}

class _ScreenOTPState extends State<ScreenOTP> {
  final otpControllers = List<TextEditingController>.generate(6, (index) => TextEditingController());

  void _submitOTP() async {
    String otp = otpControllers.map((controller) => controller.text).join();

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.myVerificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to ScreenAccountList after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) => const ScreenAccountList()),
      );
    } catch (e) {
      print("Error during OTP verification: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP. Please try again.")),
      );
    }
  }

  @override
  void dispose() {
    // Dispose of controllers to free up resources
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "We sent your code to ${widget.number.toString() } \n",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xFF757575)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  OtpForm(otpControllers: otpControllers),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

class OtpForm extends StatelessWidget {
  final List<TextEditingController> otpControllers;

  const OtpForm({required this.otpControllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return SizedBox(
                height: 55,
                width: 55,
                child: TextFormField(
                  controller: otpControllers[index],
                  onChanged: (pin) {
                    if (pin.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "0",
                    hintStyle: const TextStyle(color: Color(0xFF757575)),
                    border: authOutlineInputBorder,
                    enabledBorder: authOutlineInputBorder,
                    focusedBorder: authOutlineInputBorder.copyWith(
                      borderSide: const BorderSide(color: Color(0xFFFF7643)),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Call submit OTP function
              (context as Element).findAncestorStateOfType<_ScreenOTPState>()?._submitOTP();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFFFF7643),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}

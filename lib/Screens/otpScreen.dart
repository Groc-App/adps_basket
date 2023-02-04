// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  // const OtpScreen({super.key});
  late final otpHash;
  late final phoneNumber;

  OtpScreen({this.otpHash, this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    print("OTP HASH::" + otpHash);
    return Scaffold(
      appBar: AppBar(
          elevation: 7,
          // centerTitle: true,
          title: Text(
            "OTP verification",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child:
              // ignore: prefer_const_literals_to_create_immutables
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text("We'v sent a verification code to"),
            Text(
              '+91 8299073956',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),

            /* --------------------------------- PINPUT --------------------------------- */
            // Pinput(),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Resend OTP',
              style: TextStyle(color: Colors.green),
            ),
          ]),
        ),
      ),
    );
  }
}

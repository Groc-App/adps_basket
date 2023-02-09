// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // const OtpScreen({super.key});
  late final otpHash = '';

  late final phoneNumber = '7982733943';

  var hint = '0';

  // OtpScreen({this.otpHash, this.phoneNumber});
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('We have sent the verification code to'),
            Row(
              children: [
                Text('$phoneNumber'),
                GestureDetector(
                    onTap: () {}, child: Text('Change Phone Number?')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 60,
                  width: 40,
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        hint = '';
                      });
                    },
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      // if (value.length == 0) {
                      //   FocusScope.of(context).previousFocus();
                      // }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: hint,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 40,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: hint,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 40,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: hint,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 40,
                  child: TextFormField(
                    onChanged: (value) {
                      // if (value.length == 1) {
                      //   FocusScope.of(context).nextFocus();
                      // }
                      if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: hint,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text('Verify OTP')),
          ],
        ));
  }
}

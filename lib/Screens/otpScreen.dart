// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class OtpScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  // const OtpScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  late final phoneNumber = '7982733943';

  var hint = '0';

  // OtpScreen({this.otpHash, this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    var opthash = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var otp = opthash['otp'];
    print('otp issssssssss:   $otp');
    TextEditingController pin1 = TextEditingController();
    // TextEditingController pin2 = TextEditingController();
    // TextEditingController pin3 = TextEditingController();
    // TextEditingController pin4 = TextEditingController();
    // TextEditingController pin5 = TextEditingController();
    // TextEditingController pin6 = TextEditingController();

    // print("OTP HASH::" + otpHash);
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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('We have sent the verification code to'),
              Row(
                children: [
                  Text(
                    '$phoneNumber   ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Change Phone Number?',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: TextFormField(
                        controller: pin1,
                        // onChanged: (value) {
                        //   if (value.length == 1) {
                        //     FocusScope.of(context).nextFocus();
                        //   }
                        // },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            hintText: hint,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    // SizedBox(
                    //   height: 60,
                    //   width: 40,
                    //   child: TextFormField(
                    //     controller: pin2,
                    //     onChanged: (value) {
                    //       if (value.length == 1) {
                    //         FocusScope.of(context).nextFocus();
                    //       }
                    //       if (value.length == 0) {
                    //         FocusScope.of(context).previousFocus();
                    //       }
                    //     },
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       LengthLimitingTextInputFormatter(1),
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     decoration: InputDecoration(
                    //         hintText: hint,
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(8)))),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 60,
                    //   width: 40,
                    //   child: TextFormField(
                    //     controller: pin3,
                    //     onChanged: (value) {
                    //       if (value.length == 1) {
                    //         FocusScope.of(context).nextFocus();
                    //       }
                    //       if (value.length == 0) {
                    //         FocusScope.of(context).previousFocus();
                    //       }
                    //     },
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       LengthLimitingTextInputFormatter(1),
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     decoration: InputDecoration(
                    //         hintText: hint,
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(8)))),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 60,
                    //   width: 40,
                    //   child: TextFormField(
                    //     controller: pin4,
                    //     onChanged: (value) {
                    //       if (value.length == 1) {
                    //         FocusScope.of(context).nextFocus();
                    //       }
                    //       if (value.length == 0) {
                    //         FocusScope.of(context).previousFocus();
                    //       }
                    //     },
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       LengthLimitingTextInputFormatter(1),
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     decoration: InputDecoration(
                    //         hintText: hint,
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(8)))),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 60,
                    //   width: 40,
                    //   child: TextFormField(
                    //     controller: pin5,
                    //     onChanged: (value) {
                    //       if (value.length == 1) {
                    //         FocusScope.of(context).nextFocus();
                    //       }
                    //       if (value.length == 0) {
                    //         FocusScope.of(context).previousFocus();
                    //       }
                    //     },
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       LengthLimitingTextInputFormatter(1),
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     decoration: InputDecoration(
                    //         hintText: hint,
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(8)))),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 60,
                    //   width: 40,
                    //   child: TextField(
                    //     controller: pin6,
                    //     onChanged: (value) {
                    //       if (value.length == 0) {
                    //         FocusScope.of(context).previousFocus();
                    //       }
                    //     },
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     inputFormatters: [
                    //       LengthLimitingTextInputFormatter(1),
                    //       FilteringTextInputFormatter.digitsOnly
                    //     ],
                    //     decoration: InputDecoration(
                    //         hintText: hint,
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(8)))),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment(0, 0),
                  child: TextButton(
                      onPressed: () async {
                        try {
                          print('${pin1.text} iiiiiiiiiiiiii');
                          var smsCoded = pin1.text;
                          print(smsCoded);
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: otp,
                                  smsCode: smsCoded.toString().trim());

                          // Sign the user in (or link) with the credential
                          var cred =
                              await auth.signInWithCredential(credential);
                          print('iiiiiiiiiiiiiii ${cred.user}');
                          ref
                              .read(authCheckProvider.notifier)
                              .update((state) => cred.user.toString());
                          Navigator.pushNamed(context, '/homepage',
                              arguments: {'userid': cred.user});
                        } catch (e) {
                          if (e == null) {
                            print(' shiiiiiiiiiiiii hh     ');
                          } else {
                            print('error m');
                            print('galat hhhhhhhhhhhhhhhhhhh $e');
                          }
                        }
                      },
                      child: Text('Verify OTP'))),
            ],
          ),
        ));
  }
}

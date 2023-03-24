// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../providers/providers.dart';

class OtpScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  // const OtpScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  int start = 30;
  bool wait = true;
  var smscoded;
  bool _isLoading = false;
  bool _wrongOTP = false;

  var phoneNumber = '';
  var hint = '000000';

  void startTimer() {
    print('Timer started');
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          wait = false;
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 40,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        borderColor: Theme.of(context).primaryColor,
      ),
      style: TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smscoded = pin;
        });
      },
    );
  }

  // OtpScreen({this.otpHash, this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scheight = scSize.height;
    final scWidth = scSize.width;

    var opthash = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    var otp = opthash['otp'];
    phoneNumber = opthash['number'];
    var resendToken = opthash['resendtoken'];
    var refferalCode = opthash['refferalCode'];
    print('refferal code is:::::: $refferalCode');

    // print("OTP HASH::" + otpHash);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "OTP verification",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 15),
                    height: scheight * 0.45,
                    width: scWidth,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FOtpScreen%2FotpScreen.png?alt=media&token=e414372f-cfb9-438d-9533-04c4b94a6d3d')),
                Text(
                  'Verification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('We have sent the verification code to'),
                SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$phoneNumber   ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Change Phone Number?',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                otpField(),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    alignment: Alignment(0, 0),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () async {
                          try {
                            setState(() {
                              _isLoading = true;
                            });
                            print(smscoded);
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: otp,
                                    smsCode: smscoded.toString().trim());

                            // Sign the user in (or link) with the credential
                            var cred =
                                await auth.signInWithCredential(credential);

                            final User? user = cred.user;

                            Map<String, String?> mp = {
                              'number': user?.phoneNumber,
                              'refferalcode': refferalCode
                            };

                            // create user in nodejs backend
                            String loginstatus =
                                await ref.read(createuserProvider(mp).future);

                            print('loginstatus is:::::::: $loginstatus');
                            //chceking refferal code status
                            if (refferalCode != null &&
                                loginstatus == 'AlreadyRegistered') {
                              final snackBar = SnackBar(
                                content: const Text(
                                    'Can not use refferal code on registered account'),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                closeIconColor: Colors.white,
                                duration: Duration(seconds: 3),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                _isLoading = false;
                              });
                            } else if (refferalCode != null &&
                                loginstatus == 'WrongCode') {
                              final snackBar = SnackBar(
                                content: const Text('Wrong Refferal Code'),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                closeIconColor: Colors.white,
                                duration: Duration(seconds: 3),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                _isLoading = false;
                              });
                            } else if (refferalCode != null &&
                                loginstatus == 'error') {
                              final snackBar = SnackBar(
                                content: const Text('Error'),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                closeIconColor: Colors.white,
                                duration: Duration(seconds: 3),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                _isLoading = false;
                              });
                            } else {
                              //updating authcheckprovider
                              ref
                                  .read(authCheckProvider.notifier)
                                  .update((state) => user);

                              // navigate to home screen
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/homepage', (Route<dynamic> route) => false);
                            }
                          } catch (e) {
                            if (e == null) {
                              print(' shiiiiiiiiiiiii hh     ');
                            } else {
                              setState(() {
                                _isLoading = false;
                                _wrongOTP = true;
                              });
                              final snackBar = SnackBar(
                                content: const Text('Wrong OTP'),
                                behavior: SnackBarBehavior.floating,
                                padding: EdgeInsets.only(
                                    left: scWidth * 0.35, top: 10, bottom: 10),
                                backgroundColor: Colors.red,
                                closeIconColor: Colors.white,
                                duration: Duration(seconds: 2),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              print('galat hhhhhhhhhhhhhhhhhhh $e');
                            }
                          }
                        },
                        child: _isLoading
                            ? SpinKitThreeInOut(
                                color: Colors.white,
                              )
                            : Text(
                                'Verify OTP',
                                style: TextStyle(color: Colors.white),
                              ))),
                SizedBox(
                  height: 5,
                ),
                // if (_wrongOTP)
                //   Text('Wrong OTP, Please Enter Correct One',
                //       style: TextStyle(
                //         color: Colors.red,
                //       )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Did not get OTP?  '),
                    wait == false
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        : Text(
                            '0:${start}',
                            style: TextStyle(color: Colors.blue),
                          )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

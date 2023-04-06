// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/providers.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  int start = 30;
  bool wait = true;
  var smscoded;
  bool _isLoading = false;
  Timer? _timer;

  var phoneNumber = '';
  var hint = '000000';

  void startTimer() {
    print('Timer started');
    const onsec = Duration(seconds: 1);
    _timer = Timer.periodic(onsec, (timer) {
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
        setState(() {
          smscoded = pin;
        });
      },
    );
  }

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

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
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
                    margin: EdgeInsets.only(left: 12),
                    height: scheight * 0.45,
                    width: scWidth,
                    child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 50),
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FOtpScreen%2Fotpscreen%20(2).png?alt=media&token=8d38b962-91c8-47ce-825b-513d4897d47c')),
                SizedBox(
                  height: 15,
                ),
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
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: otp,
                                    smsCode: smscoded.toString().trim());

                            var cred =
                                await auth.signInWithCredential(credential);

                            final User? user = cred.user;

                            Map<String, String?> mp = {
                              'number': user?.phoneNumber,
                              'refferalcode': refferalCode
                            };

                            String loginstatus =
                                await ref.read(createuserProvider(mp).future);

                            if (refferalCode != '' &&
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
                            } else if (refferalCode != '' &&
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
                            } else if (loginstatus == 'error') {
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
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'username', user!.phoneNumber ?? '');

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/homepage', (Route<dynamic> route) => false);
                            }
                          } catch (e) {
                            if (e == null) {
                            } else {
                              setState(() {
                                _isLoading = false;
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
                            '0:$start',
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

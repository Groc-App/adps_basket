// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  String phoneNumber = "";
  bool _isLoading = false;
  int? _resendToken;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    String imgUrl =
        "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FLoginScreen%2FloginScreen.png?alt=media&token=a855de09-6027-4796-8e3d-80d5e501bbc7";
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: const Color.fromARGB(255, 192, 142, 212),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* ----------------------------- Image Container ---------------------------- */
              Container(
                // color: Colors.purple,
                height: scHeight * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: CachedNetworkImageProvider(imgUrl)),
                ),
              ),
              /* ----------------------------- B
              ody Container ----------------------------- */
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    // border: Border.all(width: 5, color: Colors.black)
                    ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(

                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        /* --------------------------------- Headings -------------------------------- */
                        const Text(
                          "India's last minute app",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Login or Signup",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),

                        /* -------------------------------- TextField ------------------------------- */
                        Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6, right: 2),
                                child: Text(
                                  "+91",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                // width: ,
                                child: TextFormField(
                                  onChanged: (value) {
                                    phoneNumber = value;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Phone Number',
                                    border: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /* --------------------------------- Button --------------------------------- */
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: '+91${phoneNumber}',
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    final snackBar = SnackBar(
                                      content: Text('${e.message}'),
                                      behavior: SnackBarBehavior.fixed,
                                      // padding: EdgeInsets.only(
                                      //     left: scWidth * 0.35, top: 10, bottom: 10),
                                      backgroundColor: Colors.red,
                                      closeIconColor: Colors.white,
                                      duration: Duration(seconds: 5),
                                      showCloseIcon: true,
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    setState(() {
                                      _resendToken = resendToken;
                                      _isLoading = false;
                                    });
                                    Navigator.of(context)
                                        .pushNamed('/otpScreen', arguments: {
                                      'otp': verificationId,
                                      'number': phoneNumber,
                                      'resendtoken': resendToken
                                    });
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                  timeout: Duration(seconds: 30),
                                  forceResendingToken: _resendToken,
                                );
                              } catch (e) {
                                print(e);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 148, 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: _isLoading
                                ? SpinKitThreeInOut(
                                    color: Colors.white,
                                  )
                                : Text("Continue"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/refferalloginScreen');
                          },
                          child: Container(
                            child: Text(
                              'Do you have a refferal code?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const Flexible(
                          child: Text(
                              "By continuing you agree to our terms of services and policy",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w200)),
                        )
                      ]),
                ),
              )
            ]),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/homepage', (Route<dynamic> route) => false),
        child: Container(
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.green),
          child: Text(
            'Skip for now >>',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}

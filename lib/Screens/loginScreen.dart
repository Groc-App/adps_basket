// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  int? _resendToken;
  // bool _haverefferal = false;

  // final TextEditingController _refferalcontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    String imgUrl =
        "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FLoginScreen%2Floginscreen%20(2).png?alt=media&token=173fb833-708f-4bf6-892d-9c2a780ade8c";
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* ----------------------------- Image Container ---------------------------- */
              Container(
                alignment: Alignment(0, 0),
                height: scHeight * 0.5,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //       fit: BoxFit.fitWidth,
                //       image: CachedNetworkImageProvider(imgUrl)),

                // ),
                child: Lottie.network(
                    'https://assets8.lottiefiles.com/private_files/lf30_vb7v5ca0.json'),
              ),
              /* ----------------------------- B
              ody Container ----------------------------- */
              Container(
                // height: 400,
                decoration: const BoxDecoration(),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    /* --------------------------------- Headings -------------------------------- */
                    Text(
                      "Shop easy, with Basko's speedy.",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Login or Signup",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),

                    /* -------------------------------- TextField ------------------------------- */
                    Container(
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6, right: 5),
                            child: Text(
                              "+91",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _numbercontroller,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration.collapsed(
                                hintText: 'Phone Number',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),

                    /* --------------------------------- Button --------------------------------- */
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              _isLoading = true;
                            });
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // await prefs.setString(
                            //     'username', "+91${_numbercontroller.text}");
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '+91${_numbercontroller.text}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                setState(() {
                                  _isLoading = false;
                                });
                                final snackBar = SnackBar(
                                  content: Text('Please enter valid number'),
                                  behavior: SnackBarBehavior.fixed,
                                  backgroundColor: Colors.red,
                                  closeIconColor: Colors.white,
                                  duration: Duration(seconds: 5),
                                  showCloseIcon: true,
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                setState(() {
                                  _resendToken = resendToken;
                                  _isLoading = false;
                                });
                                Navigator.of(context)
                                    .pushNamed('/otpScreen', arguments: {
                                  'otp': verificationId,
                                  'number': _numbercontroller.text,
                                  'resendtoken': resendToken,
                                  'refferalCode': '',
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
                          } catch (_) {}
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: _isLoading
                            ? SpinKitThreeInOut(
                                color: Colors.white,
                              )
                            : Text("Continue"),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Text(
                        "By continuing you agree to our terms of services and policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w200))
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
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor),
          child: Text(
            'Skip now >>',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}

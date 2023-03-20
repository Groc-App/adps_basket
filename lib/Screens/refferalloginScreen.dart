import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RefferalLogin extends StatefulWidget {
  RefferalLogin({super.key});

  @override
  State<RefferalLogin> createState() => _RefferalLoginState();
}

class _RefferalLoginState extends State<RefferalLogin> {
  var phonenumberController = TextEditingController();
  var refferalcodeController = TextEditingController();

  bool _isLoading = false;
  int? _resendToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
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
                    controller: phonenumberController,
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
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            child: Expanded(
              child: TextFormField(
                controller: refferalcodeController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: 'Refferal Code',
                  border: null,
                ),
              ),
            ),
          ),
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
                    phoneNumber: '+91${phonenumberController.text}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {
                      setState(() {
                        _isLoading = false;
                      });
                      final snackBar = SnackBar(
                        content: Text('${e.message}'),
                        behavior: SnackBarBehavior.fixed,
                        backgroundColor: Colors.red,
                        closeIconColor: Colors.white,
                        duration: Duration(seconds: 5),
                        showCloseIcon: true,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      setState(() {
                        _resendToken = resendToken;
                        _isLoading = false;
                      });
                      Navigator.of(context).pushNamed('/otpScreen', arguments: {
                        'otp': verificationId,
                        'number': phonenumberController.text,
                        'refferalCode': refferalcodeController.text,
                        'resendtoken': resendToken
                      });
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
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
                  backgroundColor: const Color.fromARGB(255, 0, 148, 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: _isLoading
                  ? SpinKitThreeInOut(
                      color: Colors.white,
                    )
                  : Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}

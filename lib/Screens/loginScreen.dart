// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    String imgUrl =
        "https://bonn.in/wp-content/uploads/2019/10/brown-dummy-with-sandwich-only.png";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: const Color.fromARGB(255, 192, 142, 212),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* ----------------------------- Image Container ---------------------------- */
              Container(
                // color: Colors.purple,
                height: scHeight * 0.54,
                decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        color: Color.fromARGB(255, 255, 237, 104),
                        spreadRadius: 15,
                        blurRadius: 15)
                  ],
                  image: DecorationImage(
                      fit: BoxFit.contain, image: NetworkImage(imgUrl)),
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
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                            "Login or Signup"),

                        /* -------------------------------- TextField ------------------------------- */
                        Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 6, right: 2),
                                child: Text(
                                  "+91",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              Expanded(
                                  // width: ,
                                  child: TextField(
                                // style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Enter Mobile Number"),
                              ))
                            ],
                          ),
                        ),

                        /* --------------------------------- Button --------------------------------- */
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/otpScreen');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 148, 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text("Continue"),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const Flexible(
                          child: Text(
                              style: TextStyle(fontWeight: FontWeight.w200),
                              "By continuing you agree to our terms of services and policy"),
                        )
                      ]),
                ),
              )
            ]),
      ),
    );
  }
}

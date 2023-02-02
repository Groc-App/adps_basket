import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    String imgUrl =
        "https://bonn.in/wp-content/uploads/2019/10/brown-dummy-with-sandwich-only.png";
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: const Color.fromARGB(255, 192, 142, 212),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image(height: scHeight * 0.6, image: NetworkImage(imgUrl)),
              Container(
                // color: Colors.purple,
                height: scHeight * 0.54,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 5),
                  // color: Colors.purpleAccent.withOpacity(0.5),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 104),
                        spreadRadius: 15,
                        blurRadius: 15)
                  ],
                  image: DecorationImage(
                      fit: BoxFit.contain, image: NetworkImage(imgUrl)),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Container(
                height: scHeight * 0.46,
                decoration: BoxDecoration(
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
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 218, 206, 206),
                                    spreadRadius: 1,
                                    blurRadius: 8)
                              ],
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 6, right: 2),
                                child: Text(
                                  "+91",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  // width: ,
                                  child: TextField(
                                decoration: InputDecoration(
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
                            onPressed: () {},
                            child: Text("Continue"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        )
                      ]),
                ),
              )
            ]),
      ),
    );
  }
}

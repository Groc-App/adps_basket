// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';

// class PINPUT extends StatelessWidget {
//   const PINPUT({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromARGB(255, 124, 124, 124)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: const Color.fromARGB(255, 74, 74, 74)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration!.copyWith(
//         color: const Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );

//     submitHandler() {
//       Navigator.of(context).pushNamed('/HomeScreen');
//     }

//     return Pinput(
//       defaultPinTheme: defaultPinTheme,
//       focusedPinTheme: focusedPinTheme,
//       submittedPinTheme: submittedPinTheme,
//       validator: (s) {
//         return s == '2222' ? submitHandler() : 'Pin is incorrect';
//       },
//       pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//       showCursor: true,
//       onCompleted: ((value) {
//         // Navigator.of(context).pushNamed('/HomeScreen');
//       }),
//     );
//   }
// }

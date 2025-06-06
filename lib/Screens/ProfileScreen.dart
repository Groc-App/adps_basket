// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Profile/CopyrightSymbol.dart';
import 'package:your_basket/Widgets/Profile/Heading.dart';
import '../Widgets/Profile/Content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          HeadingSupport(),
          SizedBox(height: 10),
          Content(),
          CopyRightSymbol(),
        ]),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uid = user?.uid;

class HeadingSupport extends ConsumerWidget {
  const HeadingSupport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authBool = ref.read(authCheckProvider);
    print(authBool);
    print(authBool?[5]);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'My Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            authBool != null
                ? const Text('7982733943')
                : Text(
                    'LogIn to view Profile',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
          ]),
          Column(
            children: const [
              Icon(
                Icons.call,
                size: 20,
              ),
              Text('Support')
            ],
          ),
        ],
      ),
    );
  }
}

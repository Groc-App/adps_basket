import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class Quote extends ConsumerWidget {
  var text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.read(qouteProvider);
    quote.whenData((data) {
      text = data;
    });

    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: const Alignment(0, 0),
      child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '\'\'${text},,',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).primaryColor),
          )),
    );
  }
}

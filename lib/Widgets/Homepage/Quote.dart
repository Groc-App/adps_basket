import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../Errors/Dataloadingerror.dart';
import '../Sinners/productsinner.dart';

class Quote extends ConsumerWidget {
  var text;

  Widget textBuild(WidgetRef ref, BuildContext context) {
    final quote = ref.watch(qouteProvider);

    return quote.when(
      data: ((data) {
        return Text(
          '\'\'${data},,',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).primaryColor),
        );
      }),
      error: (_, __) => const DataError(),
      loading: () => const Center(
        child: ProductSinner(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: const Alignment(0, 0),
      child: FittedBox(fit: BoxFit.fitWidth, child: textBuild(ref, context)),
    );
  }
}

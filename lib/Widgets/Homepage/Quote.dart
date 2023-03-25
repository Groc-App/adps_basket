import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Sinners/quotesinner.dart';

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
          '\'\'Let’s gain some weight!,,',
          maxLines: 2,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).primaryColor),
        );
      }),
      error: (_, __) => Container(),
      loading: () => const Center(
        child: QuoteSinner(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: const Alignment(0, 0),
      child: textBuild(ref, context),
    );
  }
}

// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/YourOrderes/OrdereItem.dart';

import '../providers/providers.dart';

class YourOrderes extends ConsumerWidget {
  YourOrderes({super.key});

  bool islistempty = false;
  String userid = 'dsufhjf';

  Widget orderList(WidgetRef ref, BuildContext context, double scHeight) {
    final data = ref.watch(yourordersProvider(userid));

    return data.when(
      data: (list) {
        print("Thisssssssssssssssssss is list" + '${list}');

        if (list == null) islistempty = true;
        return orderlistbuilder(list, context, scHeight);
      },
      error: (_, __) => const Center(child: Text("ERR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderlistbuilder(list, contex, scHeight) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: list.map((e) {
              return const OrdereItem();
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authInfo = ref.watch(authCheckProvider);
    print(authInfo?.uid);

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 230, 230),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Your Orders'),
        ),
        body: authInfo == null
            ? NoItems(
                noitemtext: 'Login/Signup first',
                pageroute: 'loginpage',
              )
            : islistempty == false
                ? orderList(ref, context, scHeight)
                : NoItems(
                    noitemtext: 'You have no past orders!!!',
                  ));
  }
}

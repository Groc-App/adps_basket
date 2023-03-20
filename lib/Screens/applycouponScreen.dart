import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/providers/providers.dart';

class ApplycouponScreen extends ConsumerWidget {
  ApplycouponScreen({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authInfo = ref.watch(authCheckProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coupon Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Column(
          children: [
            TextFormField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter coupon code',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(myController.text);
                var status = await ref.read(checkcouponprovider({
                  'number': authInfo!.phoneNumber ?? '',
                  'code': myController.text
                }).future);

                // status.when(data: (data) {
                //   print('yassssssss');
                if (status == 'Invalid') {
                  print('yassssssss');
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Invalid code')));
                } else if (status == 'Redeemed') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Already Redeemed')));
                } else {
                  Navigator.pop(context, {'discount': status});
                }
                // }, error: (_, __) {
                //   print('error');
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Some Error occured')));
                // }, loading: () {
                //   print('Loading');
                // });
              },
              child: Text('Apply Coupon'),
            )
          ],
        ),
      ),
    );
  }
}

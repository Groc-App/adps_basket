import 'package:flutter/material.dart';

class ApplycouponScreen extends StatelessWidget {
  ApplycouponScreen({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                print(myController.text);
              },
              child: Text('Apply Coupon'),
            )
          ],
        ),
      ),
    );
  }
}

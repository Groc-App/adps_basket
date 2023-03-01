import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/subscription_api_service.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:intl/intl.dart';

import '../models/subscription/subscription.dart';

const number = '917982733943';
Map<String, String> map = {"number": number};
var scHeight;
var scSize;

class BuySubscriptionScreen extends ConsumerStatefulWidget {
  // const OfferScreen({Key? key}) : super(key: key);

  @override
  _BuySubscriptionScreenState createState() => _BuySubscriptionScreenState();
}

class _BuySubscriptionScreenState extends ConsumerState<BuySubscriptionScreen> {
  var startDate = 'Select Date';
  var endDate = 'Select Date';

  // Initial Selected Value
  String dropdownvalue = '1';

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  // const SubscriptionScreen({super.key});
  submitHandler() {}

  startDateHandler() async {
    var datepicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2024));
    setState(() {
      var date = DateFormat('dd/MM/yyyy').format(datepicked!);
      startDate = date;
    });
  }

  endDateHandler() async {
    var datepicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2024));
    setState(() {
      var date = DateFormat('dd/MM/yyyy').format(datepicked!);
      endDate = date;
    });
  }

  quantityHandler(String? newValue) {
    setState(() {
      dropdownvalue = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebnuild ho rhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/n');
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;

    var productMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;

    var name = productMap['name'];

    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back),
        title: const Text("Buy Subscription"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: scHeight * 0.9,
          child: Column(
            children: [
              const Text(
                "Subscription Detail",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: scHeight * 0.8 * 0.2,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Dairy-Products-Png.png',
                      height: 100,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: const Text("Quantity",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          const Spacer(),
                          Container(
                            width: scSize.width * 0.6,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Container(
                                child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                focusColor: Colors.white,
                                dropdownColor: Colors.white,
                                value: dropdownvalue,
                                onChanged: (String? newValue) {
                                  quantityHandler(newValue);
                                },
                                items: items.map((String item) {
                                  return DropdownMenuItem(
                                      child: Text(item), value: item);
                                }).toList(),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: const Text("Start Date",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          const Spacer(),
                          Container(
                            width: scSize.width * 0.6,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  backgroundColor: Colors.white),
                              onPressed: () async {
                                startDateHandler();
                              },
                              child: Text(startDate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: const Text("End Date",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          const Spacer(),
                          Container(
                            width: scSize.width * 0.6,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  backgroundColor: Colors.white),
                              onPressed: () async {
                                endDateHandler();
                              },
                              child: const Text('Select Date ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: const Text("Status",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          const Spacer(),
                          Container(
                              width: scSize.width * 0.6,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: const Text("Subscribed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: scSize.width * 0.5,
                height: scHeight * 0.08,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: const Text("Buy Subscription")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

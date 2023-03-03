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

class SubscriptionScreen extends ConsumerStatefulWidget {
  // const OfferScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  // const SubscriptionScreen({super.key});

  cancelHandler(String subscriptionId) {
    map = {"subscriptionId": subscriptionId};
    APIServiceSubscription().cancelSubscription(map);
    ref.invalidate(subscriptionApiService);
    ref.invalidate(subscriptionByUserProvider);

    setState(() {});
    Navigator.pop(context);
  }

  Widget getSubscriptionList(WidgetRef ref) {
    final data = ref.watch(subscriptionByUserProvider(map));
    print("This is subscription data ${data}");

    return data.when(
      data: (list) {
        print("This is subscription list ${list}");
        return subscriptionListBuilder(list);
      },
      error: (_, __) => const Center(child: Text("ERRRRRRRRRRR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget subscriptionListBuilder(List<Subscription>? list) {
    print(list);
    return ListView.separated(
        // padding: EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: list!.length,
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: scHeight * 0.9,
                        child: Column(
                          children: [
                            const Text(
                              "Subscription Detail",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: scHeight * 0.8 * 0.2,
                              // width: double.infinit,q
                              decoration: BoxDecoration(border: Border.all()),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Dairy-Products-Png.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  ),
                                  Expanded(
                                    // fit: BoxFit.scaleDown,
                                    child: Text(
                                      list[i].product.Name,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Container(
                              child: Column(
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
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: scSize.width * 0.5,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                                list[i].quantity.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
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
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: scSize.width * 0.5,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                                '${DateFormat('dd/MM/yyyy').format(list[i].startDate)}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
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
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: scSize.width * 0.5,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                                '${DateFormat('dd/MM/yyyy').format(list[i].endDate)}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)),
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
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: scSize.width * 0.5,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: list[i].subscriptionStatus ==
                                                    true
                                                ? const Text("Subscribed",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green))
                                                : const Text("Unsubscribed",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: scHeight * 0.9 * 0.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        onPressed: () {},
                                        child: Text("Edit")),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        cancelHandler(list[i].subscriptionId);
                                      },
                                      child: Text("Cancel"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            minVerticalPadding: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: const Color.fromRGBO(245, 245, 245, 1),
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(10.0)), //add border radius here
              child: Image.asset(
                'assets/images/subscriptionCard.jpg',
                width: 80,
                fit: BoxFit.fill,
              ), //add image location here
            ),
            title: Text("${list[i].product.Name}"),
            subtitle: Text("${list[i].quantity} Qty"),
            trailing: Text(
              "₹${(list[i].quantity * list[i].product.Price).toString()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('rebnuild ho rhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/n');
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back),
        title: const Text("Subscriptions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: scHeight * 0.3,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 20,
                  // color: Color.fromRGBO(83, 177, 117, 1),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/subscriptionCard.jpg'),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 50),
                          height: scHeight * 0.3 * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "₹ 400",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: const Text(
                                  "Daily Expense",
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "My Subscriptions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              // height: scHeight * 0.7,
              padding: const EdgeInsets.all(10),
              child:
                  // Column(
                  //   children: [
                  getSubscriptionList(ref),
              // ],
            ),
            // )
          ],
        ),
      ),
    );
  }
}

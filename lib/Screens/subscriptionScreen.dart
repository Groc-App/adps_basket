import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/subscription_api_service.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:intl/intl.dart';

import '../Widgets/Cart/Noitems.dart';
import '../Widgets/Subscription/modalSheet/item.dart';
import '../Widgets/Subscription/summary/summaryCard.dart';
import '../models/subscription/subscription.dart';

var number = '';
Map<String, String> map = {"number": number};
var scHeight;
var scSize;

int totalAmount = 0;

class SubscriptionScreen extends ConsumerStatefulWidget {
  // const OfferScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  // const SubscriptionScreen({super.key});

  cancelHandler(String subscriptionId) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Cancel'),
        content: const Text('Are you sure?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              map = {"subscriptionId": subscriptionId};
              APIServiceSubscription().cancelSubscription(map);
              ref.invalidate(subscriptionApiService);
              ref.invalidate(subscriptionByUserProvider);

              setState(() {});
              Navigator.popUntil(
                  context, ModalRoute.withName('/subscriptionScreen'));
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Widget subscriptionListBuilder(List<Subscription>? list) {
    return ListView.separated(
        // padding: EdgeInsets.all(10),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
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
                            ModalItem(
                                name: list[i].product.Name,
                                imageURL: list[i].product.ImageUrl[0]),
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
                                        onPressed: () {
                                          var startDate =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(list[i].startDate);
                                          var endDate = DateFormat('dd/MM/yyyy')
                                              .format(list[i].endDate);
                                          Navigator.of(context).pushNamed(
                                              '/buySubscriptionScreen',
                                              arguments: {
                                                'product': list[i].product,
                                                'subsid':
                                                    list[i].subscriptionId,
                                                'function': 'edit',
                                                'quantity':
                                                    list[i].quantity.toString(),
                                                'startDate': startDate,
                                                'endDate': endDate,
                                              });
                                        },
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
              child: Image.network(
                list[i].product.ImageUrl[0],
                width: 80,
                fit: BoxFit.contain,
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

  Widget subsAlert() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        height: scHeight * 0.08,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            "Add Subscription Worth Rs ${50 - totalAmount} more to Activate Subscriptions",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

  Widget activated() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(83, 177, 117, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: scHeight * 0.05,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(Icons.verified),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Center(
                  child: Text(
                    "Subscription Activated",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget verificationBuild() {
    final data = ref.watch(subscriptionByUserProvider);

    return data.when(
      data: (list) {
        if (list!.isNotEmpty) {
          list.forEach(
            (e) {
              totalAmount += (e.quantity * e.product.Price).toInt();
            },
          );
          return SingleChildScrollView(
            child: Column(
              children: [
                SummaryCard(
                  totalAmount: totalAmount,
                ),
                const SizedBox(height: 20),
                totalAmount < 50 ? subsAlert() : activated(),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "My Subscriptions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // height: scHeight * 0.7,
                  padding: const EdgeInsets.all(10),
                  child: subscriptionListBuilder(list),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(
              "No Subscription Found",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
          );
        }
      },
      error: (_, __) => DataError(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    totalAmount = 0;
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;
    var authInfo = ref.watch(authCheckProvider);
    number = (authInfo == null ? '' : authInfo.phoneNumber)!;
    // number = authInfo.phoneNumber ?? '';

    return Scaffold(
        appBar: AppBar(
          title: const Text("Subscriptions"),
        ),
        body: authInfo == null
            ? NoItems(
                noitemtext: 'Login/Signup first',
                pageroute: 'loginpage',
              )
            : verificationBuild());
  }
}

// ignore_for_file: file_names, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Services/subscription_api_service.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:intl/intl.dart';

import '../Widgets/Cart/Noitems.dart';
import '../Widgets/Subscription/modalSheet/item.dart';
import '../Widgets/Subscription/summary/summaryCard.dart';
import '../models/subscription/subscription.dart';

var userNumber = '';
Map<String, String> map = {"number": userNumber};
var scHeight;
var scSize;

int totalAmount = 0;

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  // const OfferScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getNumber();
    });
  }

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
  }

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
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: list!.length,
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemBuilder: (context, i) {
          return Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
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
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
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
                                                DateFormat('dd/MM/yyyy')
                                                    .format(list[i].startDate),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
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
                                                DateFormat('dd/MM/yyyy')
                                                    .format(list[i].endDate),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
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
                                                ? Text("Subscribed",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .primaryColor))
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
                              SizedBox(
                                width: double.infinity,
                                height: scHeight * 0.9 * 0.1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green),
                                          onPressed: () {
                                            var startDate =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(list[i].startDate);
                                            var endDate =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(list[i].endDate);
                                            Navigator.of(context).pushNamed(
                                                '/buySubscriptionScreen',
                                                arguments: {
                                                  'product': list[i].product,
                                                  'subsid':
                                                      list[i].subscriptionId,
                                                  'function': 'edit',
                                                  'quantity': list[i]
                                                      .quantity
                                                      .toString(),
                                                  'startDate': startDate,
                                                  'endDate': endDate,
                                                });
                                          },
                                          child: const Text("Edit")),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          onPressed: () {
                                            cancelHandler(
                                                list[i].subscriptionId);
                                          },
                                          child: const Text("Cancel")),
                                    )
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  list[i].product.ImageUrl[0],
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(list[i].product.Name),
              subtitle: Text("${list[i].quantity} Qty"),
              trailing: Text(
                "₹${(list[i].quantity * list[i].product.Price).toString()}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
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
            style: const TextStyle(color: Colors.white),
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
          color: Theme.of(context).primaryColor,
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
    final data = ref.watch(subscriptionByUserProvider(userNumber));

    return data.when(
      data: (list) {
        if (list!.isNotEmpty) {
          for (var e in list) {
            totalAmount += (e.quantity * e.product.Price).toInt();
          }
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
                  padding: const EdgeInsets.all(10),
                  child: subscriptionListBuilder(list),
                ),
              ],
            ),
          );
        } else {
          return noItems();
        }
      },
      error: (_, __) => const DataError(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget noItems() {
    return Center(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FNoItem%2Femptylist.png?alt=media&token=4f834d3f-2064-47a3-b9c6-9dce502aa65e"),
            ),
          ),
        ),
        const Text(
          "No Subscriptions",
          style: TextStyle(fontStyle: FontStyle.italic),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    totalAmount = 0;
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Column(
            children: [
              Text(
                'Subscription',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: userNumber == ''
            ? const NoItems(
                noitemtext: 'Login/SignUp First',
                pageroute: 'loginpage',
              )
            : verificationBuild());
  }
}

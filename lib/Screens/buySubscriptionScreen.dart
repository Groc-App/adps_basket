import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Services/subscription_api_service.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Subscription/modalSheet/item.dart';
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/product/products.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

var scHeight = 0.0;

var scSize;

class BuySubscriptionScreen extends ConsumerStatefulWidget {
  const BuySubscriptionScreen({super.key});

  @override
  _BuySubscriptionScreenState createState() => _BuySubscriptionScreenState();
}

String userNumber = '';

class _BuySubscriptionScreenState extends ConsumerState<BuySubscriptionScreen> {
  var startDate = 'Select Date';
  var endDate = 'Select Date';

  String dropdownvalue = '1';
  Address address = Address(
      addressId: '',
      defaultAddress: false,
      Flat_FLoor_Tower: '',
      Street_Society: '',
      Recipients_Name: '',
      City: '',
      Pincode: '');

  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
  }

  submitHandler(String productId, String number, String stDate, String eDate,
      String functiontype, String subsid) {
    DateTime startDate =
        Intl.withLocale('en', () => DateFormat('d/M/y').parse(stDate));
    DateTime endDate =
        Intl.withLocale("en", () => DateFormat('d/M/y').parse(eDate));

    if (functiontype == 'buy') {
      Map<String, dynamic> map = {
        "quantity": dropdownvalue,
        "productId": productId,
        "number": number,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "address": address.addressId
      };
      APIServiceSubscription().createsubscription(map).whenComplete(() =>
          Navigator.pushNamed(context, '/ordersuccessScreen',
              arguments: {'type': "subscription"}));
    } else {
      Map<String, dynamic> map = {
        "quantity": dropdownvalue,
        "subsid": subsid,
        "number": number,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "address": address.addressId
      };

      int count = 0;
      ref.invalidate(subscriptionByUserProvider);
      APIServiceSubscription().editsubscription(map).whenComplete(
          () => Navigator.of(context).popUntil((_) => count++ >= 2));
    }
  }

  @override
  initState() {
    super.initState();
    getNumber();
  }

  startDateHandler() async {
    var datepicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
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
        firstDate: DateTime.now(),
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

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en', null);

    if (userNumber != '') {
      final AddressBookState = ref.watch(addressBokkProvider(userNumber));
      if (AddressBookState.AddressBookModel!.addresses.isNotEmpty) {
        var reqData = AddressBookState.AddressBookModel!.addresses
            .firstWhere((e) => e.defaultAddress == true);
        address = reqData;
      }
    }

    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;

    var productMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;

    Product product = productMap['product'];
    String functiontype = productMap['function'];
    String subsid = productMap['subsid'];
    String? Quantity = productMap['quantity'];
    String? StartDate = productMap['startDate'];
    String? EndDate = productMap['endDate'];

    return Scaffold(
      appBar: AppBar(
        title: functiontype == 'buy'
            ? const Text("Buy Subscription")
            : const Text('Edit Subscription'),
      ),
      body: userNumber == ''
          ? const NoItems(
              noitemtext: 'Login/SignUp First',
              pageroute: 'loginpage',
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: scHeight * 0.9,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Subscription Detail",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ModalItem(
                        name: product.Name, imageURL: product.ImageUrl[0]),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 4,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: const Text("Quantity",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const Spacer(),
                                Container(
                                  width: scSize.width * 0.5,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      focusColor: Colors.white,
                                      dropdownColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      value: dropdownvalue,
                                      onChanged: (String? newValue) {
                                        quantityHandler(newValue);
                                      },
                                      items: items.map((String item) {
                                        return DropdownMenuItem(
                                            value: item, child: Text(item));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 4,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: const Text("Start Date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const Spacer(),
                                Container(
                                  width: scSize.width * 0.5,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        alignment: Alignment.centerLeft,
                                        elevation: 1,
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    onPressed: () async {
                                      startDateHandler();
                                    },
                                    child: Text(startDate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 4,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: const Text("End Date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const Spacer(),
                                Container(
                                  width: scSize.width * 0.5,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        alignment: Alignment.centerLeft,
                                        elevation: 1,
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    onPressed: () async {
                                      endDateHandler();
                                    },
                                    child: Text(endDate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 4,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: const Text("Address",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).highlightColor),
                                    width: scSize.width * 0.5,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/addressScreen');
                                      },
                                      child: Text(
                                          "${address.Recipients_Name} ${address.Flat_FLoor_Tower} ${address.Street_Society} ",
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    functiontype == 'buy'
                        ? SizedBox(
                            width: scSize.width * 0.5,
                            height: scHeight * 0.05,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  var days = daysBetween(
                                      DateFormat('d/M/y').parse(startDate),
                                      DateFormat('d/M/y').parse(endDate));
                                  if (days < 3) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Center(
                                            child: Text('Date Alert')),
                                        content:
                                            const Text('Select Atleast 3 Days'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text('OK'))
                                        ],
                                      ),
                                    );
                                  } else {
                                    submitHandler(product.productId, userNumber,
                                        startDate, endDate, 'buy', subsid);
                                  }
                                },
                                child: const Text("Buy Subscription")),
                          )
                        : SizedBox(
                            width: scSize.width * 0.5,
                            height: scHeight * 0.05,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor),
                                onPressed: () {
                                  submitHandler(product.productId, userNumber,
                                      startDate, endDate, 'edit', subsid);
                                },
                                child: const Text("Edit Subscription")),
                          ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

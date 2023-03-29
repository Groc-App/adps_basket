// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/data/productsdata.dart';
import 'package:your_basket/models/product/products.dart';

import '../../providers/providers.dart';
import '../config.dart';

String userNumber = '';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
  }

  void incrementHandler(phonenumber, Product product) {
    if (counter == 5) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Quantity Exceeded'),
          content: const Text('Maximum Quantity limit is 5'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        counter++;
      });

      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel.updateCartItem(
          phonenumber, counter.toString(), product.productId);
    }
  }

  var counter = 0;

  void decrementHandler(phonenumber, Product product) {
    if ((counter - 1) == 0) {
      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel
          .removeCartItems(phonenumber, product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    } else {
      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel
          .updateCartItem(
              phonenumber, (counter - 1).toString(), product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    }
  }

  List<Product> foundUser = [];

  Widget buildProducts(List<Product> products, authInfo, scWidth) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.58,
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: products.length);
  }

  @override
  void initState() {
    super.initState();
    getNumber();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SearchData.initialize(ref);
    });
  }

  void runFilter(String enteredKeyword) {
    List<Product> results = [];
    foundUser = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users

      return;
    } else {
      results = SearchData.data
          .where((user) => user.Name.toLowerCase()
              .trim()
              .replaceAll(' ', '')
              .contains(
                  enteredKeyword.toLowerCase().trim().replaceAll(' ', '')))
          .toList();
    }

    setState(() {
      foundUser = [];
      foundUser = results;

      results = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Scaffold(
      /* ---------------------------------- BODY ---------------------------------- */
      resizeToAvoidBottomInset: true,
      body: NestedScrollView(
        body: bodyContent(scHeight, scWidth, userNumber),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.green[400],
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              centerTitle: true,
              expandedHeight: 130,
              elevation: 5.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: _buildSilverAppBarBackground(context, 100.0)),
            ),
          ];
        },
      ),
    );
  }

  _buildSilverAppBarBackground(context, height) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 25,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            height: height + 25,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                "Basko",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              primary: false,
              title: TextFormField(
                autofocus: true,
                enableSuggestions: true,
                onChanged: (value) {
                  runFilter(value);
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Search',
                ).copyWith(isDense: true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyContent(
    scHeight,
    scWidth,
    authInfo,
  ) {
    return foundUser.isEmpty
        ? SizedBox(height: scHeight * 0.8, child: noItems())
        : SizedBox(
            /* ---------------------- Building Categories Item Grid --------------------- */
            child: buildProducts(foundUser, authInfo, scWidth));
  }

  Widget noItems() {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 160),
          height: Config.scHeight * 0.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/id/1158317995/vector/cute-jack-russell-terrier-paws-up-over-wall-dog-face-cartoon-vector-illustration.jpg?s=170667a&w=0&k=20&c=e_tyRS_-oSA1eowlfNVNaU__mlNig7aETgEf3pOkaBI="),
            ),
          ),
        ),
        const Text(
          "No Items",
          style: TextStyle(fontStyle: FontStyle.italic),
        )
      ]),
    );
  }
}

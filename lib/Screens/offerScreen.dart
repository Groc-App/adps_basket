// ignore_for_file: file_names, library_private_types_in_public_api, unused_element, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Services/offer_api_service.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:confetti/confetti.dart';
import 'package:scratcher/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:your_basket/models/offer/offer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

/* --------------------------- Predefined Constant -------------------------- */

const kExpandedHeight = 165.0;
var totalOrders = 0;
String number = '';
var map = {'number': number};

/* -------------------------------------------------------------------------- */

class OfferScreen extends ConsumerStatefulWidget {
  const OfferScreen({super.key});

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen> {
  String? imageURL;

  final ConfettiController _controller = ConfettiController(
    duration: const Duration(seconds: 2),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getNumber();
    });
  }

  late var scSize;
  late var scHeight = 0.0;
  late int totalAmount = 0;

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      number = userNumberr;
    });
  }

  /* --------------------------- Scratch Controller --------------------------- */

  scratchedController(String id) {
    Map<String, String> map = {"number": number, "offerId": id};
    APIServiceOffer().updateOffer(map);

    ref.invalidate(allOfferProvider);
    ref.invalidate(offerApiService);

    setState(() {});
  }

  Widget verificationBuild() {
    final offers = ref.watch(allOfferProvider(map));

    return offers.when(
      data: (list) {
        if (list != null && list.isNotEmpty) {
          for (var offer in list) {
            totalOrders = offer.totalUserOrder.toInt();
            if (offer.isUserClaimed) {
              totalAmount += offer.worth.toInt();
            }
          }
          return NestedScrollView(
            body: _buildGridViewContainer(list),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.green[400],
                  centerTitle: true,
                  leading: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  expandedHeight: kExpandedHeight,
                  elevation: 5.0,
                  floating: false,
                  pinned: true,
                  title: innerBoxIsScrolled
                      ? const Text(
                          'Rewards',
                          style: TextStyle(color: Colors.white),
                        )
                      : null,
                  flexibleSpace: FlexibleSpaceBar(
                      background: _buildSilverAppBarBackground()),
                ),
              ];
            },
          );
        } else {}
        return _buildGridViewCards(list);
      },
      error: (_, __) => const DataError(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;

    return Scaffold(
        body: number == ''
            ? const NoItems(
                noitemtext: 'Login/SignUp First',
                pageroute: 'loginpage',
              )
            : verificationBuild());
  }

  Widget _buildRewardsPoints() {
    return Container(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '₹',
                  style: TextStyle(fontSize: 50.0),
                ),
                Text(
                  "$totalAmount",
                  style: const TextStyle(fontSize: 50.0),
                ),
              ],
            ),
            const Text(
              'Total Rewards',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            )
          ],
        ));
  }

  Widget _buildRewardImage() {
    return Container(
        decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: CachedNetworkImageProvider(
            'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Frewards_cup_image.jpg?alt=media&token=da5bffc1-c263-4007-8239-aabadbefeebc'),
      ),
    ));
  }

  Widget _buildGridViewContainer(List<Offer>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "My Rewards",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Expanded(flex: 4, child: Container(child: _buildGridViewCards(list)))
      ],
    );
  }

  Widget offerList(String number, WidgetRef ref) {
    final offers = ref.watch(allOfferProvider(map));

    return offers.when(
      data: (list) {
        return _buildGridViewCards(list);
      },
      error: (_, __) => const DataError(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  _buildGridViewCards(List<Offer>? list) {
    if (list != null) {
      return GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext context, int index) {
          if (list[index].isUserClaimed) {
            return scratchedContainer(list, index, context);
          } else {
            if (list[index].number <= totalOrders) {
              return availableCard(list, index, context);
            } else {
              return lockedCard(list, index, context);
            }
          }
        },
      );
    } else
      return Container();
  }

  Widget _buildSilverAppBarBackground() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Freward_appbar_bg.jpg?alt=media&token=bf1c3400-ba8e-48c9-8b82-29c2803bd4ee',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child: _buildRewardsPoints()),
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  /* ------------------------- Card Already Scratched ------------------------- */
  Widget scratchedContainer(List<Offer> list, index, BuildContext context) {
    return Card(
      child: GridTile(
        child: InkWell(
          child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Frewards_cup_image.jpg?alt=media&token=da5bffc1-c263-4007-8239-aabadbefeebc',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "You Won",
                          ))),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Rs ${list[index].worth.toInt()}.',
                      )),
                ],
              )),
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.black.withOpacity(0.7),
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: scHeight,
                      child: list[index].isUserRedeemed == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                    child: Text(
                                  "Already Redeemed",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(height: 15),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.green[400]),
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: scSize.width * 0.7,
                                    height: scHeight * 0.3,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              "https://st4.depositphotos.com/7668048/28693/v/600/depositphotos_286933884-stock-illustration-indian-rupee-coins-falling-scattered.jpg",
                                            )),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 8, right: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Get ₹${list[index].worth.toInt()} off",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          const SizedBox(height: 20),
                                          Container(
                                            width: scSize.width * 0.7 * 0.8,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      list[index].offerId,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        _copyToClipboard(
                                                            list[index]
                                                                .offerId);
                                                      },
                                                      icon: const Icon(
                                                          Icons.copy))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.5)),
                                      child: const Text("Close"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  Widget availableCard(List<Offer> list, index, BuildContext context) {
    return InkResponse(
      child: Container(
          margin: const EdgeInsets.only(top: 0.0),
          child: CachedNetworkImage(
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Fscratch_image.jpg?alt=media&token=5d49818f-1078-48de-abe1-dac53e69f845")),
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.black.withOpacity(0.4),
            context: context,
            enableDrag: false,
            builder: (BuildContext context) {
              return SizedBox(
                height: scHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: Mains,
                  children: [
                    Center(
                      child: Scratcher(
                        brushSize: 50,
                        threshold: 50,
                        color: Colors.red,
                        image: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Fscratch_image.jpg?alt=media&token=5d49818f-1078-48de-abe1-dac53e69f845",
                          fit: BoxFit.fill,
                        ),
                        onThreshold: () {
                          _controller.play();
                          scratchedController(list[index].offerId);
                        },
                        child: Container(
                          height: 300,
                          width: 300,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Frewards_cup_image.jpg?alt=media&token=da5bffc1-c263-4007-8239-aabadbefeebc",
                                fit: BoxFit.contain,
                                width: 150,
                                height: 150,
                              ),
                              Column(
                                children: [
                                  ConfettiWidget(
                                    blastDirectionality:
                                        BlastDirectionality.explosive,
                                    confettiController: _controller,
                                    particleDrag: 0.05,
                                    emissionFrequency: 0.01,
                                    numberOfParticles: 20,
                                    gravity: 0.05,
                                    shouldLoop: false,
                                    colors: const [
                                      Colors.green,
                                      Colors.red,
                                      Colors.yellow,
                                      Colors.blue,
                                    ],
                                  ),
                                  const Text(
                                    "You won",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    list[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.5)),
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/offerScreen', (Route<dynamic> route) => false);
                        },
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }

  Widget lockedCard(List<Offer> list, index, BuildContext context) {
    return InkResponse(
      child: Container(
        foregroundDecoration: const BoxDecoration(
          color: Colors.grey,
          backgroundBlendMode: BlendMode.saturation,
        ),
        margin: const EdgeInsets.only(top: 0.0),
        child: Stack(alignment: Alignment.center, children: [
          CachedNetworkImage(
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Offers%2Fscratch_image.jpg?alt=media&token=5d49818f-1078-48de-abe1-dac53e69f845",
            height: 320.0,
            width: 320.0,
            repeat: ImageRepeat.repeat,
          ),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            child: Center(
              child: Text(
                "${(list[index].number - totalOrders).round()} Order More to unlock",
                softWrap: true,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ]),
      ),
      onTap: () {},
    );
  }
}

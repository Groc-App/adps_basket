import 'package:flutter/material.dart';
import 'package:your_basket/Services/offer_api_service.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:confetti/confetti.dart';
import 'package:scratcher/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:your_basket/models/offer/offer.dart';

/* --------------------------- Predefined Constant -------------------------- */

const kExpandedHeight = 200.0;
const totalOrders = 15;
const number = '917982733943';
const map = {'number': number};

/* -------------------------------------------------------------------------- */

class OfferScreen extends ConsumerStatefulWidget {
  // const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen> {
  // final storageRef =
  //     FirebaseStorage.instance.ref().child('Offers/reward_appbar_bg');

  // var imageUrl = storageRef.getDownloadURL();
  late var imageURL;

  // Future<void> downloadURLExample() async {
  //   imageURL = await FirebaseStorage.instance
  //       .ref()
  //       .child("Offers/reward_appbar_bg")
  //       .getDownloadURL();
  //   print("This is the Downloaded URL ${imageURL}");
  // }

  // final bgImage = storageRef.child('Offers/reward_appbar_bg');

  final ConfettiController _controller = ConfettiController(
    duration: const Duration(seconds: 2),
  );

  // late var offers;
  int totalReward = 0;

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
  }

  late var scSize;
  late var scHeight;

  /* --------------------------- Scratch Controller --------------------------- */

  scratchedController(String id) {
    Map<String, String> map = {"number": number, "offerId": id};
    APIServiceOffer().updateOffer(map);

    ref.invalidate(allOfferProvider);
    ref.invalidate(offerApiService);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;

    print("\nRebuild");
    return Scaffold(
      body: NestedScrollView(
        body: _buildGridViewContainer(number, ref),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: true,
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: kExpandedHeight,
              elevation: 5.0,
              floating: false,
              pinned: true,
              title: innerBoxIsScrolled ? const Text('Rewards') : null,
              flexibleSpace:
                  FlexibleSpaceBar(background: _buildSilverAppBarBackground()),
            ),
          ];
        },
      ),
    );
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
                Text(
                  '₹',
                  style: TextStyle(fontSize: 50.0),
                ),
                Text(
                  "${totalReward}",
                  style: TextStyle(fontSize: 50.0),
                ),
              ],
            ),
            Text(
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
        image: AssetImage("assets/images/rewards_cup_image.jpg"),
      ),
    ));
  }

  Widget _buildGridViewContainer(String number, WidgetRef ref) {
    print("\n\nbuildGridViewContainer 1");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "My Rewards",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Expanded(flex: 4, child: Container(child: offerList(number, ref)))
      ],
    );
  }

  Widget offerList(String number, WidgetRef ref) {
    print("\n\offer list 2");

    final offers = ref.watch(allOfferProvider(map));

    return offers.when(
      data: (list) {
        // print("\nThiss is list of Offerrrrrrs:" + '${list}');
        return _buildGridViewCards(list);
      },
      error: (_, __) => const Center(child: Text(" err")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  _buildGridViewCards(List<Offer>? list) {
    print("\n\ninside build grid view cards 3");
    return GridView.builder(
      itemCount: list!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) {
        print(list[index].isUserClaimed);
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
  }

  Widget _buildSilverAppBarBackground() {
    print("\n\nIsid ebuild sliver app bar");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Stack(
              children: [
                Image.asset(
                  // 'assets/images/reward-appbar-bg.jpg',
                  'assets/images/reward_appbar_bg.jpg',
                  width: double.infinity,
                  // height: 200,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child: _buildRewardsPoints()),
                    // Expanded(flex: 1, child: _buildRewardImage())
                  ],
                ),
              ],
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage('assets/images/reward-appbar-bg.jpg'),
              //   ),
              // ),
              // decoration: BoxDecoration(border: Border.all()),
              // color: Color.fromRGBO(83, 177, 117, 1),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Expanded(flex: 1, child: _buildRewardsPoints()),
              //     // Expanded(flex: 1, child: _buildRewardImage())
              //   ],
              // ),
            )),
      ],
    );
  }

  Widget scratchedContainer(List<Offer> list, index, BuildContext context) {
    print("inside scaratched container");
    totalReward = totalReward + list[index].worth.round();

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
                    child: Image.asset(
                      'assets/images/rewards_cup_image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "You Won",
                            style: TextStyle(fontSize: 15.0),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Rs ${list[index].worth}',
                        style: TextStyle(fontSize: 20.0),
                      )),
                ],
              )),
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.black.withOpacity(0.4),
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: scHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Already Redeemed",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5)),
                              // style: ButtonStyle(backgroundColor: ),
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
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
          child: Image.asset(
            'assets/images/scratch_image.jpg',
            height: 320.0,
            width: 320.0,
            repeat: ImageRepeat.repeat,
          )),
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.black.withOpacity(0.4),
            context: context,
            builder: (BuildContext context) {
              return Container(
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
                        image: Image.asset(
                          'assets/images/scratch_image.jpg',
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
                              Image.asset(
                                "assets/images/rewards_cup_image.jpg",
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
                                    colors: [
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
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.5)),
                        // style: ButtonStyle(backgroundColor: ),
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
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
        foregroundDecoration: BoxDecoration(
          color: Colors.grey,
          backgroundBlendMode: BlendMode.saturation,
        ),
        margin: const EdgeInsets.only(top: 0.0),
        child: Stack(alignment: Alignment.center, children: [
          Image.asset(
            'assets/images/scratch_image.jpg',
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
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ),
      onTap: () {},
    );
  }
}






// InkResponse(
//               child: Container(
//                   margin: totalOrders >= index + 1
//                       ? const EdgeInsets.only(top: 20.0)
//                       : const EdgeInsets.only(top: 0.0),
//                   child: totalOrders >= index + 1
//                       ? Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                             Expanded(
//                               flex: 2,
//                               child: Image.asset(
//                                 'assets/images/rewards_cup_image.jpg',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 10.0),
//                                     child: Text(
//                                       "You Won",
//                                       style: TextStyle(fontSize: 15.0),
//                                     ))),
//                             const Expanded(
//                                 flex: 1,
//                                 child: Text(
//                                   'Rs 5',
//                                   style: TextStyle(fontSize: 20.0),
//                                 )),
//                           ],
//                         )
//                       : Image.asset(
//                           'assets/images/scratch_image.jpg',
//                           height: 320.0,
//                           width: 320.0,
//                           repeat: ImageRepeat.repeat,
//                         )),
//               onTap: () {
//                 showModalBottomSheet(
//                     isScrollControlled: true,
//                     backgroundColor: Colors.black.withOpacity(0.4),
//                     context: context,
//                     builder: (BuildContext context) {
//                       return Container(
//                         height: scHeight,
//                         child: Center(
//                           child: Scratcher(
//                             brushSize: 50,
//                             threshold: 50,
//                             color: Colors.red,
//                             image: Image.asset(
//                               "assets/images/rewards_cup_image.jpg",
//                               fit: BoxFit.fill,
//                             ),
//                             onThreshold: () => _controller.play(),
//                             child: Container(
//                               height: 300,
//                               width: 300,
//                               // color: Colors.white,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     "assets/images/rewards_cup_image.jpg",
//                                     fit: BoxFit.contain,
//                                     width: 150,
//                                     height: 150,
//                                   ),
//                                   Column(
//                                     children: [
//                                       ConfettiWidget(
//                                         blastDirectionality:
//                                             BlastDirectionality.explosive,
//                                         confettiController: _controller,
//                                         particleDrag: 0.05,
//                                         emissionFrequency: 0.05,
//                                         numberOfParticles: 20,
//                                         gravity: 0.05,
//                                         shouldLoop: false,
//                                         colors: [
//                                           Colors.green,
//                                           Colors.red,
//                                           Colors.yellow,
//                                           Colors.blue,
//                                         ],
//                                       ),
//                                       const Text(
//                                         "You won",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 25,
//                                         ),
//                                       ),
//                                       const Text(
//                                         "1 Lakh!",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 25,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//               },
//             ),
// import 'package:flutter/material.dart';
// import 'package:your_basket/Widgets/Cart/Noitems.dart';
// import 'package:confetti/confetti.dart';
// import 'package:scratcher/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:your_basket/providers/providers.dart';
// import 'package:your_basket/models/offer/offer.dart';

// class OfferScreen extends ConsumerStatefulWidget {
//   const OfferScreen({Key? key}) : super(key: key);

//   @override
//   _OfferScreenState createState() => _OfferScreenState();
// }

// const kExpandedHeight = 200.0;
// const totalOrders = 8;

// class _OfferScreenState extends ConsumerState<OfferScreen> {
//   ConfettiController _controller = new ConfettiController(
//     duration: new Duration(seconds: 2),
//   );

//   // late var offers;

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   late var scSize;
//   late var scHeight;
//   late var number = '917982733943';

//   @override
//   Widget build(BuildContext context) {
//     scSize = MediaQuery.of(context).size;
//     scHeight = scSize.height;
//     print("\nRebuild");
//     return Scaffold(
//         body: NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverAppBar(
//             centerTitle: true,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             expandedHeight: kExpandedHeight,
//             elevation: 5.0,
//             floating: false,
//             pinned: true,
//             title: innerBoxIsScrolled ? Text('Rewards') : null,
//             flexibleSpace:
//                 FlexibleSpaceBar(background: _buildSilverAppBarBackground()),
//           ),
//         ];
//       },
//       body: _buildGridViewContainer(number),
//     ));
//   }

//   Widget _buildRewardsPoints() {
//     return Container(
//         padding: EdgeInsets.only(left: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Rs',
//                   style: TextStyle(fontSize: 50.0),
//                 ),
//                 Text(
//                   "1000",
//                   style: TextStyle(fontSize: 50.0),
//                 ),
//               ],
//             ),
//             Text(
//               'Total Rewards',
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//             )
//           ],
//         ));
//   }

//   Widget _buildRewardImage() {
//     return Container(
//         decoration: BoxDecoration(
//       image: const DecorationImage(
//         fit: BoxFit.fill,
//         image: const AssetImage("assets/images/rewards_cup_image.jpg"),
//       ),
//     ));
//   }

//   _buildGridViewContainer(String number) {
//     return Column(
//       children: <Widget>[
//         Expanded(flex: 4, child: Container(child: offerList(number)))
//       ],
//     );
//   }

//   Widget offerList(String number) {
//     var map = {"number": number};
//     final offers = ref.watch(allOfferProvider(map));
//     print("\nThiss is list of Offers:" + '${offers}');

//     return offers.when(
//       data: (list) {
//         print("\nThiss is list of Offers:" + '${list}');
//         return _buildGridViewCards(list);
//       },
//       error: (_, __) => const Center(child: Text("ERR")),
//       loading: () => const Center(child: CircularProgressIndicator()),
//     );
//   }

//   _buildGridViewCards(List<Offer>? list) {
//     return GridView.builder(
//       itemCount: list!.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.0,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0),
//       padding: EdgeInsets.all(10.0),
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           child: GridTile(
//               child: InkResponse(
//             child: Container(
//                 margin: index < totalOrders
//                     ? EdgeInsets.only(top: 20.0)
//                     : EdgeInsets.only(top: 0.0),
//                 child: index < totalOrders
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           Expanded(
//                             flex: 2,
//                             child: Image.asset(
//                               'assets/images/rewards_cup_image.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Expanded(
//                               flex: 1,
//                               child: Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 10.0),
//                                   child: Text(
//                                     "You Won",
//                                     style: TextStyle(fontSize: 15.0),
//                                   ))),
//                           Expanded(
//                               flex: 1,
//                               child: Text(
//                                 'Rs 5',
//                                 style: TextStyle(fontSize: 20.0),
//                               )),
//                         ],
//                       )
//                     : Image.asset(
//                         'assets/images/scratch_image.jpg',
//                         height: 320.0,
//                         width: 320.0,
//                         repeat: ImageRepeat.repeat,
//                       )),
//             onTap: () {
//               showModalBottomSheet(
//                   isScrollControlled: true,
//                   backgroundColor: Colors.black.withOpacity(0.4),
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Container(
//                       height: scHeight,
//                       child: Center(
//                         child: Scratcher(
//                           brushSize: 50,
//                           threshold: 50,
//                           color: Colors.red,
//                           image: Image.asset(
//                             "assets/images/rewards_cup_image.jpg",
//                             fit: BoxFit.fill,
//                           ),
//                           onChange: (value) =>
//                               print("Scratch progress: $value%"),
//                           onThreshold: () => _controller.play(),
//                           child: Container(
//                             height: 300,
//                             width: 300,
//                             // color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   "assets/images/rewards_cup_image.jpg",
//                                   fit: BoxFit.contain,
//                                   width: 150,
//                                   height: 150,
//                                 ),
//                                 Column(
//                                   children: [
//                                     ConfettiWidget(
//                                       blastDirectionality:
//                                           BlastDirectionality.explosive,
//                                       confettiController: _controller,
//                                       particleDrag: 0.05,
//                                       emissionFrequency: 0.05,
//                                       numberOfParticles: 20,
//                                       gravity: 0.05,
//                                       shouldLoop: false,
//                                       colors: [
//                                         Colors.green,
//                                         Colors.red,
//                                         Colors.yellow,
//                                         Colors.blue,
//                                       ],
//                                     ),
//                                     Text(
//                                       "You won",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 25,
//                                       ),
//                                     ),
//                                     Text(
//                                       "1 Lakh!",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 25,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   });
//             },
//           )),
//         );
//       },
//     );
//   }

//   _buildSilverAppBarBackground() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Expanded(
//             flex: 2,
//             child: Container(
//               decoration: BoxDecoration(border: Border.all()),
//               // color: Color.fromRGBO(83, 177, 117, 1),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(flex: 1, child: _buildRewardsPoints()),
//                   Expanded(flex: 1, child: _buildRewardImage())
//                 ],
//               ),
//             )),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:your_basket/Services/offer_api_service.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:confetti/confetti.dart';
import 'package:scratcher/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:your_basket/models/offer/offer.dart';

const kExpandedHeight = 200.0;
const totalOrders = 1;
const number = '917982733943';
const map = {'number': number};

// class OfferScreen extends ConsumerStatefulWidget {
//   const OfferScreen({Key? key}) : super(key: key);

//   @override
//   _OfferScreenState createState() => _OfferScreenState();
// }

class OfferScreen extends ConsumerWidget {
  OfferScreen({super.key});

  int totalReward = 0;
  ConfettiController _controller = new ConfettiController(
    duration: new Duration(seconds: 20),
  );

  late var scSize;
  late var scHeight;

  scratchedController(String id) {
    Map<String, String> map = {"number": number, "offerId": id};
    APIServiceOffer().updateOffer(map);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    scSize = MediaQuery.of(context).size;
    scHeight = scSize.height;
    print("\nRebuild");
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            centerTitle: true,
            leading: IconButton(
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
      body: _buildGridViewContainer(number, ref),
    ));
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
                  'Rs',
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
      children: <Widget>[
        Expanded(flex: 4, child: Container(child: offerList(number, ref)))
      ],
    );
  }

  Widget offerList(String number, WidgetRef ref) {
    print("\n\offer list 2");

    // var map = {"number": number};
    final offers = ref.watch(allOfferProvider(map));

// Where _time is type Time
    print("\nThiss is list of Offers:" +
        '${offers.whenData((value) => print(value))}');

    return offers.when(
      data: (list) {
        print("\nThiss is list of Offerrrrrrs:" + '${list}');
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
        totalReward = totalReward + list[index].worth.round();
        print(list[index].isUserClaimed);
        if (list[index].isUserClaimed) {
          return scratchedContainer(list, index, context);
        } else {
          if (index <= totalOrders) {
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
            child: Container(
              // decoration: BoxDecoration(border: Border.all()),
              color: Color.fromRGBO(83, 177, 117, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(flex: 1, child: _buildRewardsPoints()),
                  // Expanded(flex: 1, child: _buildRewardImage())
                ],
              ),
            )),
      ],
    );
  }

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
                      child: Center(
                        child: Text(
                          "Already Redeemed",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
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
                child: Center(
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
                              const Text(
                                "1 Lakh!",
                                style: TextStyle(
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
              );
            });
      },
    );
  }

  Widget lockedCard(List<Offer> list, index, BuildContext context) {
    return InkResponse(
      child: Container(
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
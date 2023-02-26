import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

const kExpandedHeight = 200.0;

class _OfferScreenState extends State<OfferScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: kExpandedHeight,
            elevation: 5.0,
            floating: false,
            pinned: true,
            title: innerBoxIsScrolled ? Text('Rewards') : null,
            flexibleSpace:
                FlexibleSpaceBar(background: _buildSilverAppBarBackground()),
          ),
        ];
      },
      body: _buildGridViewContainer(),
    ));
  }

  Widget _buildRewardsPoints() {
    return Container(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Rs'),
                Text(
                  "1000RS",
                  style: TextStyle(fontSize: 60.0),
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

  // _buildRewardsPoints() {
  //   return Container(
  //       padding: EdgeInsets.only(left: 20.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: <Widget>[
  //               Text('Rs'),
  //               Text(
  //                 "1000RS",
  //                 style: TextStyle(fontSize: 60.0),
  //               ),
  //             ],
  //           ),
  //           Text(
  //             'Total Rewards',
  //             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
  //           )
  //         ],
  //       ));
  // }

  Widget _buildRewardImage() {
    return Container(
        decoration: BoxDecoration(
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: const AssetImage("assets/scratch-card_screen.jpg"),
      ),
    ));
  }

  _buildGridViewContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(flex: 4, child: Container(child: _buildGridViewCards()))
        ],
      ),
    );
  }

  _buildGridViewCards() {
    return GridView.builder(
      itemCount: 15,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) {
        // DocumentSnapshot ds = snapshot.data.documents[index];
        // ScratchCardModel scratchCard = ScratchCardModel(
        //     ds.documentID,
        //     'assets/rewards_flower_image.jpg',
        //     'You\'ve won',
        //     ds['amount'],
        //     ds['scratched']);
        return Card(
          child: GridTile(
              child: InkResponse(
            child: Container(
                margin: true == true
                    ? EdgeInsets.only(top: 20.0)
                    : EdgeInsets.only(top: 0.0),
                child: true == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              'assets/images/scratch_image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(
                                    "You Won",
                                    style: TextStyle(fontSize: 15.0),
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Rs 5',
                                style: TextStyle(fontSize: 20.0),
                              )),
                        ],
                      )
                    : Image.asset(
                        'assets/scratch_image.jpg',
                        height: 320.0,
                        width: 320.0,
                        repeat: ImageRepeat.repeat,
                      )),
            onTap: () {
              // Navigator.push(
              //     context,
              //     ScaleRoute(
              //       widget: ScratchRoughPage(
              //           'assets/rewards_flower_image.jpg', scratchCard),
              //     ));
            },
          )),
        );
      },
    );
  }

  // ScratchCardModel _randomScratchCard(List<ScratchCardModel> scratchCardList) {
  //   final _random = new Random();
  //   ScratchCardModel scratchCard =
  //       scratchCardList[_random.nextInt(scratchCardList.length)];
  //   return scratchCard;
  // }

  _buildSilverAppBarBackground() {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFFFDD734),
              child: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: _buildRewardsPoints()),
                  Expanded(flex: 1, child: _buildRewardImage())
                ],
              ),
            )),
      ],
    );
  }
}

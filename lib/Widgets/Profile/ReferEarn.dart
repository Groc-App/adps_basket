import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:your_basket/Screens/offerScreen.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/models/user/user.dart';

import '../../providers/providers.dart';

class ReferEarnScreen extends StatelessWidget {
  ReferEarnScreen({super.key});
  bool _isLogin = true;

  Widget refferalId(WidgetRef ref, String number) {
    var data = ref.watch(getrefferalIdProvider(number));

    return data.when(
      data: (value) {
        print('value in refferalId is:::::::::');
        if (value != null) return _buildrefferal(value);
        return Container();
      },
      loading: () {
        return CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        return DataError();
      },
    );
  }

  Widget _buildrefferal(UserN value) {
    return Column(
      children: [
        SizedBox(
          height: 13,
        ),
        CachedNetworkImage(
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/ReferAndEarn%2Frefersteps.png?alt=media&token=46f43c83-3c56-4fe9-990f-5989df3346a8',
          fit: BoxFit.fitWidth,
        ),
        // Spacer(),
        SizedBox(
          height: 25,
        ),

        // My earnings ----------------------------->>>>>>>>>>>>

        Text(
          'My Earnings:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment(0, 0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                'Reffered People:\n${value.referralOffer['referredPeople']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(83, 177, 117, 1)),
              )),
          SizedBox(
            width: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              'Refferal Claimed:\n${value.referralOffer['isClaimed']}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 202, 54, 44)),
            ),
          )
        ]),

        SizedBox(
          height: 14,
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(children: [
            TextSpan(
              text: 'Use code ',
            ),
            TextSpan(
              text: 'REF10',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(83, 177, 117, 1)),
            ),
            TextSpan(
              text: ' to get ₹10 off on your next order.',
            )
          ]),
        ),

        // refferal code --------->>>>>>

        SizedBox(
          height: 24,
        ),

        Text(
          'Your Refferal Code:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          color: Color.fromARGB(255, 215, 209, 209),
          child: DottedBorder(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
            color: Colors.black,
            strokeWidth: 1,
            child: Text(
              value.referralCode,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        GestureDetector(
          child: const Tooltip(
              preferBelow: false,
              message: "Copy",
              child: const Text(
                'Tap to Copy',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
          onTap: () {
            Clipboard.setData(ClipboardData(text: value.referralCode));
          },
        ),

        // share button -------------->>>>>>

        SizedBox(
          height: 20,
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(
              color: Color.fromRGBO(83, 177, 117, 1),
              // border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.share,
                color: Colors.white,
              ),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  Share.share(
                    'Hii, look what i got \nhttps://play.google.com/store/apps/details?id=com.instructivetech.kidskite',
                    subject: 'Look what i made!!!!!!!!!',
                  );
                },
                child: Text(
                  'Share the app',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String number = '';
    var argData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    if (argData['number'] == null) {
      _isLogin = false;
    } else
      number = argData['number'];

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Refer and Earn'),
          ),
          body: _isLogin == false
              ? NoItems(
                  noitemtext: 'Login/SignUp First',
                  pageroute: 'loginpage',
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/ReferAndEarn%2FReferAndEarn.png?alt=media&token=c670dec4-f810-4e6d-b3b2-d431d114d71a',
                        fit: BoxFit.fitWidth,
                      ),
                      Consumer(
                        builder: (context, ref, child) =>
                            refferalId(ref, number),
                      ),
                      // refferalId('', number);
                      // _buildrefferal('ebjcjjkb'),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

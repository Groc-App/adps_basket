// ignore_for_file: file_names, must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/models/user/user.dart';

import '../providers/providers.dart';

class ReferEarnScreen extends ConsumerWidget {
  bool _isLogin = true;

  ReferEarnScreen({super.key});
  Widget refferalId(WidgetRef ref, String number, BuildContext context) {
    var data = ref.watch(getrefferalIdProvider(number));

    return data.when(
      data: (value) {
        if (value != null) return _buildrefferal(value, context);
        return Container();
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        return const DataError();
      },
    );
  }

  Widget _buildrefferal(UserN value, BuildContext context) {
    return Column(
      children: [
        // My earnings ----------------------------->>>>>>>>>>>>

        const Text(
          'My Earnings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            elevation: 5,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: const Alignment(0, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[400]!.withOpacity(0.6)),
                child: Text(
                  'Reffered People\n${value.referralOffer['referredPeople']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: const Alignment(0, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[400]!.withOpacity(0.6)),
              child: Text(
                'Refferal Claimed\n${value.referralOffer['isClaimed']}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          )
        ]),

        const SizedBox(
          height: 14,
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(children: [
            const TextSpan(
              text: 'Use code ',
            ),
            TextSpan(
              text: 'REF10',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
            const TextSpan(
              text: ' to get ₹10 off on your next order.',
            )
          ]),
        ),

        // refferal code --------->>>>>>

        const SizedBox(
          height: 24,
        ),

        const Text(
          'Your Referral Code',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.green[400]!.withOpacity(0.6),
          child: DottedBorder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
            color: Colors.black,
            strokeWidth: 1,
            child: Text(
              value.referralCode,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        GestureDetector(
          child: const Tooltip(
              preferBelow: false,
              message: "Copy",
              child: Text(
                'Tap to Copy',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
          onTap: () {
            Clipboard.setData(ClipboardData(text: value.referralCode));
          },
        ),

        // share button -------------->>>>>>

        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String number = '';
    var argData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    if (argData['number'] == null) {
      _isLogin = false;
    } else {
      number = argData['number'];
    }

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Refer and Earn'),
          ),
          body: _isLogin == false
              ? const NoItems(
                  noitemtext: 'Login/SignUp First',
                  pageroute: 'loginpage',
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      refferalId(ref, number, context),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Steps to refer",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 0),
                        leading: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 0, top: 8, bottom: 8),
                          child: Text(
                            'Invite your friend to signup',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 0, bottom: 0),
                        leading: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 0, top: 8, bottom: 8),
                          child: Text(
                            'Make sure your friend add your refer code while signup',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 0, bottom: 0),
                        leading: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 0, top: 8, bottom: 8),
                          child: Text(
                            'Your friend will get ₹10 off on first order',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 0, bottom: 0),
                        leading: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 0, top: 8, bottom: 8),
                          child: Text(
                            'You will get ₹10 off after your friend\'s first order',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                // border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                      'Hii, look what i got \nhttps://play.google.com/store/apps/details?id=com.instructivetech.kidskite',
                                      subject: 'Look what i made!!!!!!!!!',
                                    );
                                  },
                                  child: const Text(
                                    'Share the app',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // refferalId(ref, number, context),
                      // _buildrefferal('ebjcjjkb'),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Sinners/loadingsinner.dart';
import '../../models/address/address.dart' as Addresmodel;
import '../../providers/providers.dart';

class Address extends ConsumerWidget {
  Addresmodel.Address data;
  String userId;
  Function bottomsheet;

  Address(
      {super.key,
      required this.data,
      required this.userId,
      required this.bottomsheet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (data.defaultAddress == true) {
            } else {
              final addressModel = ref.read(addressBokkProvider.notifier);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return LoadingSinner();
                  },
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
              addressModel
                  .setSelectedAddress(userId, data.addressId)
                  .whenComplete(() => Navigator.pop(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoadingSinner(),
                      )));
            }
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle),
            width: scWidth * 0.065,
            height: scWidth * 0.065,
            child: Container(
              decoration: BoxDecoration(
                  color:
                      data.defaultAddress == true ? Colors.black : Colors.white,
                  shape: BoxShape.circle),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home - ${data.Recipients_Name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                  "${data.Flat_FLoor_Tower} ${data.Street_Society} ${data.City} ${data.Pincode}")
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
            onTap: () {
              bottomsheet(ref, context, userId, scHeight, 'updateAddress',
                  data.addressId);
            },
            child: Container(child: Icon(Icons.edit))),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            final addressModel = ref.read(addressBokkProvider.notifier);
            addressModel.deleteAddress(userId, data.addressId);
          },
          child: Container(
            child: Icon(Icons.delete),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

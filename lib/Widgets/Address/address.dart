// ignore_for_file: library_prefixes, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Screens/addressScreen.dart';
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
              final addressModel =
                  ref.read(addressBokkProvider(phonenumber).notifier);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const LoadingSinner();
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
                            const LoadingSinner(),
                      )));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: Colors.black12, shape: BoxShape.circle),
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
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home - ${data.Recipients_Name}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                  "${data.Flat_FLoor_Tower} ${data.Street_Society} ${data.City} ${data.Pincode}")
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              bottomsheet(ref, context, userId, scHeight, 'updateAddress',
                  data.addressId);
            },
            child: const Icon(Icons.edit)),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            final addressModel =
                ref.read(addressBokkProvider(phonenumber).notifier);
            addressModel.deleteAddress(userId, data.addressId);
          },
          child: const Icon(Icons.delete),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

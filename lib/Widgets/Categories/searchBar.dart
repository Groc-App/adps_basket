// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 40,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              color: Colors.green,
            ),
            Container(
              alignment: Alignment.center,
              width: 250,
              margin: const EdgeInsets.only(left: 10),
              child: TextFormField(
                onTap: () {
                  Navigator.of(context).pushNamed('/searchScreen');
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Search',
                ).copyWith(isDense: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

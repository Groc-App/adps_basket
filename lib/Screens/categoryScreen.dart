// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Categories/CategoriesGrid.dart';
import 'package:your_basket/Widgets/Categories/categoriesSlider.dart';
import 'package:your_basket/models/product.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* ------------------------------- dummy Data ------------------------------- */
    var dummyList = List.generate(20, (index) => Catalog().products[0]);

    /* --------------------------- Screen Intilization -------------------------- */
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    /* -------------------------------- Scaffold -------------------------------- */
    return Scaffold(

        /* --------------------------------- appBar --------------------------------- */
        appBar: AppBar(
            centerTitle: true,
            // ignore: prefer_const_constructors
            title: Text(
              "Milk And Bakery",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
            backgroundColor: const Color.fromARGB(255, 237, 230, 230)),
        backgroundColor: const Color.fromARGB(255, 237, 230, 230),

        /* ---------------------------------- body ---------------------------------- */
        body: SingleChildScrollView(
            child: Column(
          children: [
            /* ---------------------------- Top SLider Bar ---------------------------- */
            Container(
              height: 50,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Search here......",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.filter_list)
                ],
              ),
            ),
            Container(
              height: 130,
              alignment: Alignment.center,
              // width: sc_width * 0.9,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: dummyList.length,
                scrollDirection: Axis.horizontal,

                /* --------------------- Building Slider category Items --------------------- */
                itemBuilder: ((context, index) => CategorySliderItems(
                    dummyList[index].name, dummyList[index].image)),
              ),
            ),
            // Carousel(),

            /* -------------------------------------------------------------------------- */

            /* ------------------------------Body Pane----------------------------- */

            SizedBox(
              height: scHeight * 0.8,
              // width: sc_width * 0.s8,

              /* ---------------------- Building Categories Item Grid --------------------- */
              child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CatergoriesGrid();
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 40.0,
                      mainAxisSpacing: 20),
                  itemCount: dummyList.length),
            )
          ],
        )));
  }
}

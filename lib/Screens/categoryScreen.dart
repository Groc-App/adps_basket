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
            title: Text("Milk And Bakery"),
            backgroundColor: Colors.redAccent),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),

        /* ---------------------------------- body ---------------------------------- */
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              /* ---------------------------- Top SLider Bar ---------------------------- */
              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 50,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: dummyList.length,
                  scrollDirection: Axis.horizontal,

                  /* --------------------- Building Slider category Items --------------------- */
                  itemBuilder: ((context, index) => CategorySliderItems(
                      dummyList[index].name, dummyList[index].image)),
                ),
              ),

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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.75,
                            crossAxisCount: 2,
                            crossAxisSpacing: 40.0,
                            mainAxisSpacing: 20),
                    itemCount: dummyList.length),
              )
            ],
          )),
        ));
  }
}

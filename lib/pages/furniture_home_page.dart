import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furniture_app/models/furniture_model.dart';
import 'package:furniture_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureHomePage extends StatefulWidget {
  const FurnitureHomePage({super.key});

  @override
  State<FurnitureHomePage> createState() => __FurnitureHomePageState();
}

class __FurnitureHomePageState extends State<FurnitureHomePage> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/menu-icon.png",
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/search.png",
                      height: 20,
                    )
                  ],
                ),
                Positioned(
                    left: 50,
                    top: -10,
                    child: Text.rich(TextSpan(
                        text: "Nueva\n",
                        style: GoogleFonts.antonio(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 45),
                        children: [
                          TextSpan(
                              text: "Colección\n",
                              style: GoogleFonts.antonio(
                                  height: 0.6,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45))
                        ])))
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            const Text.rich(TextSpan(
                text:
                    "Proin eu arcu diam. Aenean vel erat congue, mattis enim in, tincidunt erat. Mattis enim in, tincidunt erat. ",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                children: [
                  TextSpan(
                      text: "Lee más",
                      style: TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey,
                          fontSize: 18))
                ])),
            const SizedBox(
              height: 30,
            ),
            ListProductsCategory(),
            Expanded(
                child: MasonryGridView.builder(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    itemCount: mockData.length,
                    itemBuilder: (context, index) {
                      final items = mockData[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Image.asset(items.imagePath),
                                    Positioned(
                                        top: 15,
                                        right: 15,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: const Icon(
                                            Icons.bookmark_outline_sharp,
                                            size: 30,
                                            color: Colors.black45,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${items.name.split(" ").first}\n${items.name.split(" ").last}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1),
                                  ),
                                  Text("\$${items.price}",
                                      style: GoogleFonts.antonio(
                                          letterSpacing: -1,
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2)))
          ],
        ),
      ))),
    );
  }

  SizedBox ListProductsCategory() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: furnitureCategory.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: Text(
                    furnitureCategory[index],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? Colors.amber
                            : Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              selectedIndex == index
                  ? Container(
                      height: 5,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }
}

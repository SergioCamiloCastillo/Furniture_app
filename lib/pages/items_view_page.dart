import 'package:flutter/material.dart';
import 'package:furniture_app/models/furniture_model.dart';

class ItemsViewPage extends StatefulWidget {
  final CollectionModel collectionModel;
  const ItemsViewPage({super.key, required this.collectionModel});

  @override
  State<ItemsViewPage> createState() => _ItemsViewPageState();
}

class _ItemsViewPageState extends State<ItemsViewPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
            itemCount: widget.collectionModel.collectionProducts.length,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            itemBuilder: (context, index) {
              final collectionImage =
                  widget.collectionModel.collectionProducts[index];
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(collectionImage.imagePath))),
              );
            })
      ]),
    );
  }
}

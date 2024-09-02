import 'package:flutter/material.dart';
import 'package:furniture_app/models/furniture_model.dart';
import 'package:furniture_app/utils/colors.dart';

class ItemsDetailPage extends StatelessWidget {
  final CollectionDetailsModel collectionDetailsModel;
  const ItemsDetailPage({super.key, required this.collectionDetailsModel});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: [
        Column(
          children: [],
        )
      ]),
    );
  }
}

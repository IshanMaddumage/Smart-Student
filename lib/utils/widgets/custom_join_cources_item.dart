import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomJoinCourcesItem extends StatelessWidget {
  const CustomJoinCourcesItem({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String id;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomText(
        text: 'Price: $price',
        fontSize: 12,
      ),
      title: CustomText(
        text: title,
        fontSize: 16,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CourceItem {
  final String id;
  final String title;
  final double price;

  CourceItem({
    required this.id,
    required this.title,
    required this.price,
  });
}

class JoinCource with ChangeNotifier {
  final Map<String, CourceItem> _items = {};

  Map<String, CourceItem> get items {
    return {..._items};
  }

  void addItem(String courceId, String title, double price) {
    if (_items.containsKey(courceId)) {
      Logger().w('already add');
    } else {
      _items.putIfAbsent(
        courceId,
        () => CourceItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
        ),
      );
    }

    notifyListeners();
  }
}

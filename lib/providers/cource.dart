import 'package:flutter/material.dart';

class Cource with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String qualifiation;
  final String imageUrl;
  final String syllabusUrl;
  final String duration;
  final double courceFee;
  bool isEnrolled;
  bool isFavorite;

  Cource({
    required this.id,
    required this.title,
    required this.description,
    required this.qualifiation,
    required this.imageUrl,
    required this.syllabusUrl,
    required this.duration,
    required this.courceFee,
    this.isEnrolled = false,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleEnrolledStatus() {
    !isEnrolled;
    notifyListeners();
  }
}

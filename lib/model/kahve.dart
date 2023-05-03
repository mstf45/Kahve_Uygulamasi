import 'package:flutter/cupertino.dart';

enum KahveCategory { Kahveler }

const categoryIcons = {KahveCategory.Kahveler: Image(image: AssetImage(''))};

class Kahve {
  String? imagePath;
  String title;
  double fiyat;
  Kahve({
    this.imagePath,
    required this.title,
    required this.fiyat,
  });
}

import 'package:flutter/material.dart';
import 'package:xyz/model/kahve.dart';

class KahveItem extends StatelessWidget {
  const KahveItem(this.kahve,{Key? key}) : super(key: key);

  final Kahve kahve;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(kahve.title),
        subtitle: Text('\$ ${kahve.fiyat.toStringAsFixed(2)}'),
        leading: Image.asset(kahve.imagePath.toString(),fit: BoxFit.fill),
      ),
    );
  }
}

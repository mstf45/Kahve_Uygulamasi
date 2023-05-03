import 'package:flutter/material.dart';
import 'package:xyz/model/kahve.dart';
import 'package:xyz/widgets/kahve_list_klas/kahve_item.dart';

class KahveList extends StatelessWidget {
  const KahveList({
    Key? key,
    required this.kahvem,
    required this.onRemoveKahve, //Kahve Silme Alani
  }) : super(key: key);

  final List<Kahve> kahvem;
  final void Function(Kahve kahvem) onRemoveKahve;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kahvem.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveKahve(kahvem[index]);
        },
        key: ValueKey(kahvem[index]),
        child: KahveItem(kahvem[index]),
      ),
    );
  }
}

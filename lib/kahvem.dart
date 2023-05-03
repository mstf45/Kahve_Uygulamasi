import 'package:flutter/material.dart';
import 'package:xyz/model/kahve.dart';
import 'package:xyz/widgets/kahve_list_klas/kahvem_list.dart';
import 'package:xyz/widgets/new_kahve.dart';

class KahvemPage extends StatefulWidget {
  const KahvemPage({Key? key}) : super(key: key);

  @override
  State<KahvemPage> createState() => _KahvemPageState();
}

class _KahvemPageState extends State<KahvemPage> {
  final List<String> _imgPath = [
    'assets/americano.png',
    'assets/cappuccino.png',
    'assets/espresso.png',
    'assets/latte.png',
    'assets/türk_kahvesi.png',
  ];
  final List<Kahve> _registerKahve = [
    Kahve(imagePath: 'assets/americano.png', title: 'Americano', fiyat: 10),
    Kahve(imagePath: 'assets/cappuccino.png', title: 'Cappuccino', fiyat: 15),
    Kahve(imagePath: 'assets/espresso.png', title: 'Espresso', fiyat: 20),
    Kahve(imagePath: 'assets/latte.png', title: 'Latte', fiyat: 25),
    Kahve(imagePath: 'assets/türk_kahvesi.png', title: 'Türk Kahvesi', fiyat: 30),
  ];

  void _openAddShowNewModelBottomList() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 550,
          child: NewKahve(
            onAddKahve: _addKahve,
          ),
        );
      },
    );
  }

  void _addKahve(Kahve kahve) {
    setState(() {
      _registerKahve.add(kahve);
    });
  }

  void _removeKahve(Kahve kahve) {
    final kahveIndex = _registerKahve.indexOf(kahve);
    setState(() {
      _registerKahve.remove(kahve);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text('Kahve Silindi'),
        action: SnackBarAction(
          label: 'Silindi',
          onPressed: () {
            setState(() {
              _registerKahve.insert(kahveIndex, kahve);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyAlani = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            textAlign: TextAlign.center,
            'Sepette hiç ürün görünmüyor. \nYeni bir ürün eklemek ister misin ?',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
    if (_registerKahve.isNotEmpty) {
      bodyAlani = KahveList(
        kahvem: _registerKahve,
        onRemoveKahve: _removeKahve,
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Kahve Uygulaması'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _openAddShowNewModelBottomList,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: bodyAlani,
          ),
        ],
      ),
    );
  }
}

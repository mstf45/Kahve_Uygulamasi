import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xyz/model/kahve.dart';

class NewKahve extends StatefulWidget {
  const NewKahve({
    Key? key,
    required this.onAddKahve,
  }) : super(key: key);

  final void Function(Kahve kahve) onAddKahve; //Kahve Ekleme Alani
  @override
  State<NewKahve> createState() => _NewKahveState();
}

class _NewKahveState extends State<NewKahve> {
  void _submitVeriGirisContoller() {
    final enteredAmound = double.tryParse(_priceController.text);
    final amountIsvalid = enteredAmound == null || enteredAmound <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsvalid ||
        _imagePathController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.orange,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          title: const Text('Uyarı'),
          content: const Text('Lütfen Boş Bıraktığınız Yerleri Doldurunuz'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Okay',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddKahve(
      Kahve(
        title: _titleController.text,
        fiyat: enteredAmound,
        imagePath: _imagePathController.text,
      ),
    );
    Navigator.pop(context);
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Kahve Adı'),
            ),
          ),
          Flexible(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixText: '\$ ',
                label: Text('Kahve Fiyatı'),
              ),
            ),
          ),
          TextField(
            controller: _imagePathController,
            decoration: const InputDecoration(
              label: Text('Kahve Görseli Yolu'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _submitVeriGirisContoller,
                child: const Text('Ekle'),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

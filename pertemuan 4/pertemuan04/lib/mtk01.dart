import 'package:flutter/material.dart';
import 'mtk02.dart';

class Mtk01 extends StatefulWidget {
  const Mtk01({Key? key}) : super(key: key);

  @override
  _Mtk01State createState() => _Mtk01State();
}

class _Mtk01State extends State<Mtk01> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _operation = '';

  void _calculate() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0.0;
    double result = 0.0;

    switch (_operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = (num2 != 0)
            ? num1 / num2
            : double.infinity; // Menghindari pembagian dengan nol
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Mtk02(hasil: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pemilihan Perhitungan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _operation = '+';
                    _calculate();
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _operation = '-';
                    _calculate();
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _operation = '*';
                    _calculate();
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _operation = '/';
                    _calculate();
                  },
                  child: const Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

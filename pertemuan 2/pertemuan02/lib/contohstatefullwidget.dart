import 'package:flutter/material.dart';

class ContohStatefulWidget extends StatefulWidget {
  @override
  _ContohStatefulWidgetState createState() => _ContohStatefulWidgetState();
}

class _ContohStatefulWidgetState extends State<ContohStatefulWidget> {
  final TextEditingController _controller = TextEditingController();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Input'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value; // Memperbarui state saat input berubah
                });
              },
            ),
            // Menampilkan nama secara langsung
            Text(
              'Nama: $_name',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

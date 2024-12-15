import 'package:flutter/material.dart';
import 'page02.dart'; // Pastikan import Halaman Kedua benar

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  final String pnama = "Khairil Fadhillah";
  final String pnpm = "2210010482";
  final String pprodi = "Teknik Informatika";
  final String psemester = "V";
  final List<String> listprogram = ["PHP", "Flutter", "C++"];
  final Map<String, dynamic> mapData = {
    "IPS-1": 4.00,
    "IPS-2": 4.00,
    "IPS-3": 4.00,
    "Grade": "Terbaikkk",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Pertama')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page02(
                  npm: pnpm,
                  nama: pnama,
                  prodi: pprodi,
                  semester: psemester,
                  pemrograman: listprogram,
                  mapData: mapData,
                ),
              ),
            );
          },
          child: const Text('Menuju Halaman Ke-2'),
        ),
      ),
    );
  }
}

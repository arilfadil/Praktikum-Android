import 'package:flutter/material.dart';
import 'konversi.dart'; // Mengimpor kelas Konversi

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Nilai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(), // Menampilkan halaman input
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final List<String> grades = ['A', 'B', 'C', 'C+', 'D', 'E'];
  final List<String> selectedGrades = List.filled(12, 'A'); // Default to 'A'
  final Konversi konversi = Konversi();

  // Daftar nama mata kuliah
  final List<String> mataKuliah = [
    'Matematika',
    'Fisika',
    'Kimia',
    'Biologi',
    'Pemrograman Dasar',
    'Struktur Data',
    'Jaringan Komputer',
    'Sistem Operasi',
    'Basis Data',
    'Analisis dan Perancangan Sistem',
    'Kecerdasan Buatan',
    'Pengembangan Web'
  ];

  void calculateAndNavigate() {
    double totalSKS = 23; // Total SKS yang ditentukan
    double totalNilai = 0;

    for (String grade in selectedGrades) {
      totalNilai += konversi.sksMatkul(grade);
    }

    double ipk = totalNilai / selectedGrades.length;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(totalSKS: totalSKS, ipk: ipk),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Nilai Mata Kuliah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                            mataKuliah[index]), // Menampilkan nama mata kuliah
                      ),
                      DropdownButton<String>(
                        value: selectedGrades[index],
                        items: grades.map((String grade) {
                          return DropdownMenuItem<String>(
                            value: grade,
                            child: Text(grade),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGrades[index] = newValue!;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: calculateAndNavigate,
              child: Text('Hitung Nilai'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double totalSKS;
  final double ipk;

  ResultPage({required this.totalSKS, required this.ipk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Perhitungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total SKS: $totalSKS'),
            Text('IPK: ${ipk.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

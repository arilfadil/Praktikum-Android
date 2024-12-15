import 'package:flutter/material.dart';

class Slipgaji extends StatelessWidget {
  final int gajiTotal;
  final int tunjGol;
  final int tunjStatus;
  final int tunjMasaKerja;
  final String nip;
  final String nama;
  const Slipgaji(
      {super.key,
      required this.nip,
      required this.nama,
      required this.tunjGol,
      required this.tunjStatus,
      required this.tunjMasaKerja,
      required this.gajiTotal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slip Gaji Pegawai'),
        backgroundColor: const Color.fromARGB(255, 2, 217, 255),
      ),
      body: Center(
        child: Column(
          children: [
            Text('NIP : $nip'),
            Text('Nama Pegawai : $nama'),
            Text('NIP : $nip'),
            Text('Tunjangan Golongan : $tunjGol'),
            Text('Tunjangan Status : $tunjStatus'),
            Text('Tunjangan Masa Kerja : $tunjMasaKerja'),
            Text('Gaji Total : $gajiTotal'),
          ],
        ),
      ),
    );
  }
}

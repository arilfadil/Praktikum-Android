import 'package:flutter/material.dart';

class Studikasus04 extends StatefulWidget {
  const Studikasus04({super.key});

  @override
  State<Studikasus04> createState() => _Studikasus04State();
}

class _Studikasus04State extends State<Studikasus04> {
  String? _pilihan;
  String url = '';
  String displayedUrl = '';

  void loadImage() {
    setState(() {
      displayedUrl = url; // Gambar hanya ditampilkan setelah tombol diklik
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image dan Radiobutton'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile(
              title: const Text('Hokage 1'),
              value: 'Hokage 1',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png/revision/latest/scale-to-width-down/1911?cb=20140406065909&path-prefix=id';
                });
              },
            ),
            RadioListTile(
              title: const Text('Hokage 2'),
              value: 'Hokage 2',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://cdn.idntimes.com/content-images/duniaku/post/20191219/kage-terkuat-tobirama-senju-4f785ff7a463c753eddd05d0c0e9da9b.jpg';
                });
              },
            ),
            RadioListTile(
              title: const Text('Hokage 3'),
              value: 'Hokage 3',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://cdn.idntimes.com/content-images/community/2023/08/2906592-cropped-56965fbaa68adf470a17cc45ea5d328d-1c144a7a493a45ebf933a8015a055700_600x400.jpg';
                });
              },
            ),
            RadioListTile(
              title: const Text('Hokage 4'),
              value: 'Hokage 4',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://img.koran-jakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokage-keempat-minato-namikaze-230420120651.jpeg';
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  (_pilihan != null && url.isNotEmpty) ? loadImage : null,
              child: const Text('Load Image'),
            ),
            const SizedBox(height: 16),
            Text(
              'Pilihan Kami: $_pilihan',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            if (displayedUrl.isNotEmpty) buildImageCard(displayedUrl),
          ],
        ),
      ),
    );
  }
}

// Fungsi untuk membangun kotak gambar
Widget buildImageCard(String imageUrl) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), // Sudut melengkung
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10), // Sudut melengkung untuk gambar
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
        height: 150.0, // Tinggi kontainer
        width: double.infinity, // Lebar penuh
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null),
          );
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Center(child: Text('Gagal memuat gambar'));
        },
      ),
    ),
  );
}

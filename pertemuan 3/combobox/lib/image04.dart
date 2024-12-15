import 'package:flutter/material.dart';

class Imaga04 extends StatelessWidget {
  const Imaga04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView( // Agar konten dapat digulir
        child: Column(
          children: [
            buildImageCard(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfr3uFvL4HQ_sXXkUtGhF94bQSrCNLeC5J4w&s',
            ),
            buildImageCard(
              'https://cdn.idntimes.com/contentimages/duniaku/post/20191219/kage-terkuat-tobirama-senju4f785ff7a463c753eddd05d0c0e9da9b.jpg',
            ),
            buildImageCard(
              'https://cdn.idntimes.com/contentimages/community/2023/08/2906592-cropped-56965fbaa68adf470a17cc45ea5d328d1c144a7a493a45ebf933a8015a055700_600x400.jpg',
            ),
            buildImageCard(
              'https://img.koranjakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokagekeempat-minato-namikaze-230420120651.jpeg',
            ),
            buildImageCard(
              'https://assets.pikiranrakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg',
            ),
          ],
        ),
      ),
    );
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
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(child: Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}

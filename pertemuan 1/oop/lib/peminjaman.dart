import 'Anggota.dart';
import 'Buku.dart';

class Peminjaman extends Buku{
  Anggota  anggota;
  DateTime? tanggalPinjam;

  Peminjaman(String Judul, String Pengarang, int tahunTerbit, this.anggota):super(Judul 
  ,Pengarang,tahunTerbit)
  {
    tanggalPinjam =DateTime.now();//menentukan tanggal saat ini
  }
@override
  void info(){
    super.info();//Memanggil info dari kelas buku
    print('Dipinjam oleh : ${anggota}, Tanggal Pinjam : ${tanggalPinjam}' );
  }

}

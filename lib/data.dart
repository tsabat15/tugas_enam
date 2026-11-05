import 'package:material_ui/material_ui.dart';

class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.tiket,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String lokasi; // kabupaten/kota
  final String kategori;
  final String deskripsi;
  final String tiket; // harga tiket atau "Gratis"
  final IconData ikon;
  final Color warna;
}

/// Harga tiket hanyalah perkiraan untuk contoh aplikasi.
const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    lokasi: 'Kabupaten Toba',
    kategori: 'Alam',
    deskripsi:
        'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di '
        'tengahnya. Cocok untuk menikmati panorama dan budaya Batak.',
    tiket: 'Gratis',
    ikon: Icons.water,
    warna: Color(0xFF1565C0),
  ),
  Destinasi(
    id: 2,
    nama: 'Bukit Lawang',
    lokasi: 'Kabupaten Langkat',
    kategori: 'Alam',
    deskripsi:
        'Gerbang Taman Nasional Gunung Leuser, tempat wisatawan dapat melihat '
        'orangutan sumatera di habitat aslinya bersama pemandu.',
    tiket: 'Rp150.000',
    ikon: Icons.forest,
    warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3,
    nama: 'Berastagi',
    lokasi: 'Kabupaten Karo',
    kategori: 'Pegunungan',
    deskripsi:
        'Kota sejuk di dataran tinggi Karo yang dikenal dengan pasar buah, '
        'Bukit Gundaling, serta pemandangan Gunung Sinabung dan Sibayak.',
    tiket: 'Rp10.000',
    ikon: Icons.landscape,
    warna: Color(0xFF558B2F),
  ),
  Destinasi(
    id: 4,
    nama: 'Istana Maimun',
    lokasi: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana Kesultanan Deli yang dibangun pada akhir abad ke-19, memadukan '
        'gaya Melayu, Islam, dan Eropa.',
    tiket: 'Rp10.000',
    ikon: Icons.castle,
    warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5,
    nama: 'Air Terjun Sipiso-piso',
    lokasi: 'Kabupaten Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun setinggi sekitar 120 meter di tepi utara Danau Toba, dengan '
        'tangga panjang menuju dasarnya.',
    tiket: 'Rp5.000',
    ikon: Icons.waves,
    warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6,
    nama: 'Masjid Raya Al-Mashun',
    lokasi: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Masjid bersejarah peninggalan Kesultanan Deli yang berdiri sejak awal '
        'abad ke-20 dengan arsitektur yang megah.',
    tiket: 'Gratis',
    ikon: Icons.mosque,
    warna: Color(0xFF6A1B9A),
  ),
];

Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

import 'package:material_ui/material_ui.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('Panduan wisata Sumatera Utara'),
            subtitle: Text('Tugas Rutin 6 Pemrograman Mobile'),
          ),
          ListTile(
            leading: Icon(Icons.payments_outlined),
            title: Text('Harga tiket adalah perkiraan'),
            subtitle: Text('Periksa kembali sebelum berkunjung.'),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Muhammad Tsabat Muhyiyuddin'),
            subtitle: Text('NIM 4243250002 · PSIK24D'),
          ),
        ],
      ),
    );
  }
}

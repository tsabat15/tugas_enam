import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.destinasi});

  final Destinasi? destinasi; // null bila ID di URL tidak dikenal

  @override
  Widget build(BuildContext context) {
    final d = destinasi;
    if (d == null) return const HalamanTidakDitemukan();

    final info = _InfoDestinasi(destinasi: d);
    final gambar = _GambarDestinasi(destinasi: d);

    return Scaffold(
      appBar: AppBar(title: Text(d.nama, overflow: TextOverflow.ellipsis)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 700) {
            // Lebar: gambar dan info berdampingan
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: gambar),
                Expanded(child: SingleChildScrollView(child: info)),
              ],
            );
          }
          // Sempit: gambar di atas, info di bawah
          return ListView(children: [gambar, info]);
        },
      ),
    );
  }
}

/// Stack: label kategori menumpuk di atas gambar.
class _GambarDestinasi extends StatelessWidget {
  const _GambarDestinasi({required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final d = destinasi;
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: d.warna.withValues(alpha: 0.15),
              child: Icon(d.ikon, size: 120, color: d.warna),
            ),
          ),
          Positioned(left: 12, top: 12, child: Chip(label: Text(d.kategori))),
        ],
      ),
    );
  }
}

class _InfoDestinasi extends StatelessWidget {
  const _InfoDestinasi({required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    final d = destinasi;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.nama, style: teks.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.place_outlined, size: 18, color: skema.primary),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  d.lokasi,
                  style: teks.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Tiket: ${d.tiket}',
            style: teks.titleMedium?.copyWith(color: skema.primary),
          ),
          const SizedBox(height: 16),
          Text(d.deskripsi, style: teks.bodyLarge),
        ],
      ),
    );
  }
}

class HalamanTidakDitemukan extends StatelessWidget {
  const HalamanTidakDitemukan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tidak ditemukan')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            const Text('Destinasi tidak ditemukan.'),
            FilledButton(
              onPressed: () => context.go('/'),
              child: const Text('Kembali ke daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_06/halaman_daftar.dart';
import 'package:pm_tugas_06/main.dart';

/// Lebar yang diuji sesuai spesifikasi: 360 dp sampai 1280 dp.
const List<double> lebarUji = [360, 412, 600, 768, 839, 840, 1024, 1280];

Future<void> aturLayar(WidgetTester tester, double lebar) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = Size(lebar, 800);
  addTearDown(tester.view.reset);
}

/// Router global dipakai bersama, jadi posisi dikembalikan ke awal tiap uji.
Future<void> keAwal(WidgetTester tester) async {
  await tester.pumpWidget(const WisataApp());
  GoRouter.of(tester.element(find.byType(Navigator).first)).go('/');
  await tester.pumpAndSettle();
}

void main() {
  test('Jumlah kolom mengikuti tiga ukuran', () {
    expect(kolomUntuk(360), 2);
    expect(kolomUntuk(768), 3);
    expect(kolomUntuk(1280), 4);
  });

  for (final lebar in lebarUji) {
    testWidgets('Tanpa overflow pada lebar $lebar', (tester) async {
      await aturLayar(tester, lebar);
      await keAwal(tester);
      // Overflow dilaporkan sebagai exception, sehingga tes akan gagal.
      expect(tester.takeException(), isNull);

      // Kartu terakhir bisa tertutup NavigationBar, jadi digulir dulu.
      await tester.ensureVisible(find.text('Masjid Raya Al-Mashun'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Masjid Raya Al-Mashun'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.textContaining('Tiket:'), findsOneWidget);
    });
  }

  testWidgets('Navigasi berganti pada batas 840 dp', (tester) async {
    await aturLayar(tester, 839);
    await keAwal(tester);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);

    await aturLayar(tester, 840);
    await tester.pumpAndSettle();
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('ID tidak dikenal menampilkan halaman tidak ditemukan', (
    tester,
  ) async {
    await keAwal(tester);
    GoRouter.of(tester.element(find.byType(Navigator).first))
        .go('/destinasi/99');
    await tester.pumpAndSettle();
    expect(find.text('Destinasi tidak ditemukan.'), findsOneWidget);
  });
}

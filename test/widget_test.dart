import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_saku_siswa/main.dart';

void main() {
  testWidgets('Dashboard UI test', (WidgetTester tester) async {
    // Jalankan aplikasi SakuSiswaApp
    await tester.pumpWidget(const SakuSiswaApp());

    // Cek apakah judul Dashboard berhasil tampil di layar
    expect(find.text('SakuSiswa Dashboard'), findsOneWidget);
  });
}
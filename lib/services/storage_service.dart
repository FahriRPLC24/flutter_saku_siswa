import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// ==========================================
// FUNGSI SIMPAN DATA
// ==========================================
Future<void> simpanDataLokal(
  int totalSaldo,
  List<Map<String, dynamic>> riwayat,
) async {
  final prefs = await SharedPreferences.getInstance();
  
  // Simpan saldo
  await prefs.setInt('total_saldo', totalSaldo);
  
  // Ubah List<Map> ke List<String> JSON
  List<String> dataStringList = riwayat.map((item) => jsonEncode(item)).toList();
  
  // Simpan riwayat
  await prefs.setStringList('riwayat', dataStringList);
  
  print('✅ Data disimpan: Saldo=$totalSaldo, ${riwayat.length} item');
}

// ==========================================
// FUNGSI MUAT DATA
// ==========================================
Future<Map<String, dynamic>> muatDataLokal() async {
  final prefs = await SharedPreferences.getInstance();
  
  // Baca saldo (default 0 jika belum ada)
  int saldo = prefs.getInt('total_saldo') ?? 0;
  
  // Baca riwayat (default empty list)
  List<String>? dataStringList = prefs.getStringList('riwayat');
  List<Map<String, dynamic>> riwayat = [];
  
  if (dataStringList != null) {
    riwayat = dataStringList
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }
  
  print('✅ Data dimuat: Saldo=$saldo, ${riwayat.length} item');
  
  return {
    'saldo': saldo,
    'riwayat': riwayat,
  };
}
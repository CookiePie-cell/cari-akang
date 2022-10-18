import 'package:cari_akang/data/gender.dart';
import 'package:cari_akang/data/status.dart';

class OrangHilang {
  String id, nama, namaPelapor;
  String? alamat, keterangan;
  Gender jenisKelamin;
  StatusLaporan statusLaporan;
  int? umur;
  DateTime tanggalPosting;

  OrangHilang(
      {required this.id,
      required this.namaPelapor,
      required this.nama,
      required this.jenisKelamin,
      required this.tanggalPosting,
      this.umur,
      this.statusLaporan = StatusLaporan.hilang,
      this.alamat,
      this.keterangan});
}

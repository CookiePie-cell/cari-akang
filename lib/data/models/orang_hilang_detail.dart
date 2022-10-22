import 'package:cari_akang/data/gender.dart';
import 'package:cari_akang/data/status.dart';

class OrangHilangDetail {
  final String id,
      namaPelapor,
      namaOrangHilang,
      warnaKulit,
      jenisRambut,
      foto,
      kontak,
      tanggalPosting;
  final int? umur, tinggiBadan, beratBadan;
  final Gender jenisKelamin;
  final String? alamat, warnaRambut, lainnya, keterangan;
  final StatusLaporan? statusLaporan;

  OrangHilangDetail(
      {required this.id,
      required this.namaPelapor,
      required this.namaOrangHilang,
      required this.warnaKulit,
      required this.jenisRambut,
      required this.foto,
      required this.kontak,
      required this.jenisKelamin,
      required this.tanggalPosting,
      this.umur,
      this.tinggiBadan,
      this.beratBadan,
      this.alamat,
      this.warnaRambut,
      this.lainnya,
      this.keterangan,
      this.statusLaporan = StatusLaporan.hilang});
}

List<OrangHilangDetail> orangHilangDetail = [
  OrangHilangDetail(
      id: '1',
      namaPelapor: 'Alo Bin Ucup',
      namaOrangHilang: 'Roronoa Zoro',
      warnaKulit: 'Kuning langsat',
      jenisRambut: 'Lurus',
      tanggalPosting: '9 November 2022',
      foto:
          'https://cdn-2.tstatic.net/banten/foto/bank/images/One-Piece-Roronoa-Zoro-sesat.jpg',
      umur: 30,
      alamat: 'Tomohon, Sulawesi Utara',
      kontak: '081234567890',
      jenisKelamin: Gender.laki_laki,
      tinggiBadan: 180,
      beratBadan: 70,
      warnaRambut: 'Hijau',
      lainnya: 'Mata kiri tidak bisa melihat',
      keterangan: 'Hilang di negeri Wano'),
  OrangHilangDetail(
      id: '2',
      namaPelapor: 'Henri Huo',
      namaOrangHilang: 'Dariana King',
      warnaKulit: 'Putih',
      jenisRambut: 'Lurus',
      tanggalPosting: '9 November 2022',
      foto:
          'https://media.istockphoto.com/photos/caucasian-woman-enjoying-at-beach-picture-id1262310682',
      umur: 20,
      kontak: '081234567890',
      jenisKelamin: Gender.perempuan),
  OrangHilangDetail(
      id: '3',
      namaPelapor: 'Matius Fasti',
      namaOrangHilang: 'Rosallin Rowe',
      warnaKulit: 'Putih',
      jenisRambut: 'Lurus',
      tanggalPosting: '9 November 2022',
      foto:
          'https://wallpapersmug.com/download/1024x768/c49619/brunette-woman-outdoor-autumn.jpg',
      umur: 28,
      kontak: '081234567890',
      jenisKelamin: Gender.perempuan),
];

List<OrangHilangDetail> ditemukan = [
  OrangHilangDetail(
      id: '4',
      namaPelapor: 'Norwood Lubowitz',
      namaOrangHilang: 'Surach Prassti',
      warnaKulit: 'Sawo matang',
      jenisRambut: 'Lurus',
      tanggalPosting: '9 November 2022',
      foto:
          'https://image.shutterstock.com/shutterstock/photos/116512825/display_1500/stock-photo-indian-handsome-young-man-portrait-on-outdoor-background-116512825.jpg',
      umur: 38,
      kontak: '081234567890',
      jenisKelamin: Gender.laki_laki,
      statusLaporan: StatusLaporan.ditemukan),
];

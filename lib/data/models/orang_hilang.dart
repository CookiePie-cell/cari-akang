import 'package:cari_akang/data/gender.dart';
import 'package:cari_akang/data/status.dart';

class OrangHilang {
  String id, nama, namaPelapor, imgUrl;
  String? alamat, keterangan;
  Gender jenisKelamin;
  StatusLaporan statusLaporan;
  int? umur;
  String tanggalPosting;

  OrangHilang({
    required this.id,
    required this.namaPelapor,
    required this.nama,
    required this.jenisKelamin,
    required this.tanggalPosting,
    required this.imgUrl,
    this.umur,
    this.statusLaporan = StatusLaporan.hilang,
    this.alamat,
    this.keterangan,
  });
}

final missings = [
  OrangHilang(
      id: "1",
      namaPelapor: "Henri Huo",
      nama: "Kiarra Jacobson",
      jenisKelamin: Gender.perempuan,
      tanggalPosting: "15 Oktober 2022",
      imgUrl:
          "https://il6.picdn.net/shutterstock/videos/2277788/thumb/1.jpg?i10c=img.resize(height:72)",
      umur: 23),
  OrangHilang(
      id: "2",
      namaPelapor: "john tompson",
      nama: "Dariana King",
      jenisKelamin: Gender.perempuan,
      tanggalPosting: "30 Agustus 2022",
      imgUrl: "https://ak.picdn.net/shutterstock/videos/15671722/thumb/1.jpg",
      umur: 20),
  OrangHilang(
      id: "3",
      namaPelapor: "Matius fasto",
      nama: "Rosallin Rowe",
      jenisKelamin: Gender.perempuan,
      tanggalPosting: "23 Oktober 2022",
      imgUrl:
          "https://wallpapersmug.com/download/1024x768/c49619/brunette-woman-outdoor-autumn.jpg",
      umur: 28),
  OrangHilang(
      id: "4",
      namaPelapor: "surach prassti",
      nama: "Norwood Lubowitz",
      jenisKelamin: Gender.laki_laki,
      tanggalPosting: "9 November 2022",
      imgUrl:
          "https://image.shutterstock.com/shutterstock/photos/116512825/display_1500/stock-photo-indian-handsome-young-man-portrait-on-outdoor-background-116512825.jpg",
      umur: 38)
];

final found = [
  OrangHilang(
      id: "4",
      namaPelapor: "surach prassti",
      nama: "Norwood Lubowitz",
      jenisKelamin: Gender.laki_laki,
      tanggalPosting: "9 November 2022",
      statusLaporan: StatusLaporan.ditemukan,
      imgUrl:
          "https://image.shutterstock.com/shutterstock/photos/116512825/display_1500/stock-photo-indian-handsome-young-man-portrait-on-outdoor-background-116512825.jpg",
      umur: 38)
];

final bookmarks = [];

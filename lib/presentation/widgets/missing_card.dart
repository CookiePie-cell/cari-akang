import 'package:cari_akang/data/gender.dart';
import 'package:cari_akang/data/status.dart';
import 'package:flutter/material.dart';

class MissingCard extends StatelessWidget {
  // const MissingCard({Key? key});
  const MissingCard(
      {Key? key,
      required this.id,
      required this.nama,
      required this.namaPelapor,
      required this.umur,
      required this.jenisKelamin,
      required this.onTap,
      required this.imgURL,
      required this.tanggalPosting,
      this.statusLaporan,
      this.alamat,
      this.keterangan})
      : super(key: key);

  final VoidCallback onTap;
  final String id, nama, namaPelapor, imgURL, tanggalPosting;
  final int? umur;
  final Gender jenisKelamin;
  final String? alamat, keterangan;
  final StatusLaporan? statusLaporan;

  @override
  Widget build(BuildContext context) {
    // log((statusLaporan == StatusLaporan.hilang).toString());
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          // width: 180,
          height: 200,
          child: Stack(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  Container(
                    width: 130,
                    height: 180,
                    color: Colors.black,
                    child:
                        Image(image: NetworkImage(imgURL), fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _cardInfo('Pelapor', namaPelapor, 42.0),
                          const SizedBox(height: 2.0),
                          _cardInfo(
                              'Status',
                              statusLaporan == StatusLaporan.hilang
                                  ? 'Hilang'
                                  : 'Ditemukan',
                              51.0),
                          const SizedBox(height: 2.0),
                          _cardInfo('Nama', nama, 52.0),
                          const SizedBox(height: 2.0),
                          _cardInfo('Umur', '$umur Tahun', 54.0),
                          const SizedBox(height: 2.0),
                          _cardInfo(
                              'Jenis Kelamin',
                              jenisKelamin == Gender.laki_laki
                                  ? 'Laki-laki'
                                  : 'Perempuan',
                              6.0),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tanggalPosting,
                    style: const TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12.0,
                        color: Colors.black45),
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  Widget _cardInfo(String key, String value, double spaces) {
    return Row(
      children: [
        Text(
          key,
          style: const TextStyle(
              fontFamily: 'Segoe UI', fontSize: 14.0, color: Colors.black54),
        ),
        SizedBox(
          width: spaces,
        ),
        const Text(
          ':',
          style: TextStyle(
              fontFamily: 'Segoe UI', fontSize: 14.0, color: Colors.black54),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Flexible(
          child: Container(
            color: key == 'Status'
                ? statusLaporan == StatusLaporan.hilang
                    ? Colors.red
                    : Colors.greenAccent[700]
                : null,
            child: Padding(
              padding: key == 'Status'
                  ? const EdgeInsets.symmetric(horizontal: 8.0)
                  : EdgeInsets.symmetric(horizontal: 0.0),
              child: Text(
                value,
                // softWrap: true,
                // overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14.0,
                    color: key == 'Status' ? Colors.white : Colors.black54),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

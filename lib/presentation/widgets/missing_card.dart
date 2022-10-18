import 'package:flutter/material.dart';

class MissingCard extends StatelessWidget {
  const MissingCard({Key? key}) : super(key: key);
  // const MissingCard(
  //     {Key? key,
  //     required this.id,
  //     required this.nama,
  //     required this.namaPelapor,
  //     required this.umur,
  //     required this.jenisKelamin,
  //     required this.onTap,
  //     this.alamat,
  //     this.keterangan})
  //     : super(key: key);

  // final VoidCallback onTap;
  // final String id, nama, namaPelapor;
  // final int umur;
  // final Gender jenisKelamin;
  // final String? alamat, keterangan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          // width: 180,
          height: 150,
          child: Stack(children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
                  child: Container(
                    width: 100,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _cardInfo('Pelapor', 'Utu Dodutu', 42.0),
                        const SizedBox(height: 2.0),
                        _cardInfo('Status', 'Hilang', 51.0),
                        const SizedBox(height: 2.0),
                        _cardInfo('Nama', 'Alo Ferguson', 52.0),
                        const SizedBox(height: 2.0),
                        _cardInfo('Umur', '15 Tahun', 54.0),
                        const SizedBox(height: 2.0),
                        _cardInfo('Jenis Kelamin', 'Laki-laki', 6.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '15 Oktober 2022 10:50AM',
                    style: TextStyle(
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
          child: Text(
            value,
            // softWrap: true,
            // overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'Segoe UI', fontSize: 14.0, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

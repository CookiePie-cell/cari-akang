import 'package:cari_akang/presentation/widgets/data_info_field.dart';
import 'package:flutter/material.dart';

import '../../../data/gender.dart';

class DetailDataStep extends StatelessWidget {
  const DetailDataStep(
      {Key? key,
      required this.namaPelapor,
      required this.namaOrangHilang,
      required this.jenisKelamin,
      this.alamat,
      this.umur})
      : super(key: key);

  final String namaPelapor, namaOrangHilang;
  final Gender jenisKelamin;
  final String? alamat;
  final int? umur;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataInfoField(label: 'Nama pelapor', value: namaPelapor),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Nama orang yang hilang', value: namaOrangHilang),
        SizedBox(height: 8.0),
        DataInfoField(
            label: 'Umur',
            value: umur == null ? '-' : '${umur.toString()} Tahun'),
        SizedBox(height: 8.0),
        DataInfoField(
            label: 'Jenis kelamin',
            value:
                jenisKelamin == Gender.laki_laki ? 'Laki-laki' : 'Perempuan'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Alamat', value: alamat == null ? '-' : alamat!),
      ],
    );
  }
}

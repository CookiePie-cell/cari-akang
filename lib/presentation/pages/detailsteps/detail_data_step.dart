import 'package:cari_akang/presentation/widgets/data_info_field.dart';
import 'package:flutter/material.dart';

class DetailDataStep extends StatelessWidget {
  const DetailDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DataInfoField(label: 'Nama pelapor', value: 'Alo Bin Ucup'),
        SizedBox(height: 8.0),
        DataInfoField(
            label: 'Nama orang yang hilang', value: 'Sir Alex Ferguson'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Umur', value: '20 Tahun'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Jenis kelamin', value: 'Laki-laki'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Alamat', value: 'Sulawesi Utara, Tomohon'),
      ],
    );
  }
}

import 'package:cari_akang/presentation/widgets/data_info_field.dart';
import 'package:cari_akang/presentation/widgets/large_data_info_field.dart';
import 'package:flutter/material.dart';

class DetailKeteranganStep extends StatelessWidget {
  const DetailKeteranganStep({Key? key, required this.kontak, this.keterangan})
      : super(key: key);

  final String kontak;
  final String? keterangan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeDataInfoField(
            label: 'Keterangan kejadian',
            value: keterangan == null ? '-' : keterangan!),
        const SizedBox(
          height: 12.0,
        ),
        DataInfoField(label: 'Kontak yang bisa dihubungi', value: kontak),
      ],
    );
  }
}

import 'package:cari_akang/presentation/widgets/data_info_field.dart';
import 'package:cari_akang/presentation/widgets/large_data_info_field.dart';
import 'package:flutter/material.dart';

class DetailKeteranganStep extends StatelessWidget {
  const DetailKeteranganStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        LargeDataInfoField(
            label: 'Keterangan kejadian',
            value:
                'lok adsasd atesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasdtesasd'),
        SizedBox(
          height: 12.0,
        ),
        DataInfoField(
            label: 'Kontak yang bisa dihubungi', value: '081234567890'),
      ],
    );
  }
}

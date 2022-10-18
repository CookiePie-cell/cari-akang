import 'package:cari_akang/presentation/widgets/data_info_field.dart';
import 'package:cari_akang/presentation/widgets/large_data_info_field.dart';
import 'package:flutter/material.dart';

class DetailCiriCiriStep extends StatelessWidget {
  const DetailCiriCiriStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DataInfoField(label: 'Tinggi badan', value: '150 cm'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Berat badan', value: '50 kg'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Warna kulit', value: 'Kuning langsat'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Jenis rambut', value: 'Tidak berambut'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Warna rambut', value: '-'),
        SizedBox(height: 8.0),
        DataInfoField(label: 'Warna rambut', value: '-'),
        SizedBox(
          height: 8.0,
        ),
        LargeDataInfoField(
            label: 'Lainnya',
            value:
                'lok adsasd atesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasd tesasdtesasd')
      ],
    );
  }
}

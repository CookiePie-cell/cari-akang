import 'package:cari_akang/presentation/widgets/data_info_field.dart';
import 'package:cari_akang/presentation/widgets/large_data_info_field.dart';
import 'package:flutter/material.dart';

class DetailCiriCiriStep extends StatelessWidget {
  const DetailCiriCiriStep(
      {Key? key,
      required this.warnaKulit,
      required this.jenisRambut,
      this.tinggiBadan,
      this.beratBadan,
      this.warnaRambut,
      this.lainnya})
      : super(key: key);

  final String warnaKulit, jenisRambut;
  final int? tinggiBadan, beratBadan;
  final String? warnaRambut, lainnya;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataInfoField(
            label: 'Tinggi badan',
            value: tinggiBadan == null ? '-' : tinggiBadan.toString()),
        const SizedBox(height: 8.0),
        DataInfoField(
            label: 'Berat badan',
            value: beratBadan == null ? '-' : '${beratBadan.toString()} kg'),
        const SizedBox(height: 8.0),
        DataInfoField(label: 'Warna kulit', value: warnaKulit),
        const SizedBox(height: 8.0),
        DataInfoField(label: 'Jenis rambut', value: jenisRambut),
        const SizedBox(height: 8.0),
        DataInfoField(
            label: 'Warna rambut',
            value: warnaRambut == null ? '-' : warnaRambut!),
        const SizedBox(
          height: 8.0,
        ),
        LargeDataInfoField(
            label: 'Lainnya', value: lainnya == null ? '-' : lainnya!)
      ],
    );
  }
}

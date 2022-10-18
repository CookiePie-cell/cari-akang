import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class KeteranganStep extends StatefulWidget {
  const KeteranganStep({super.key});

  @override
  State<KeteranganStep> createState() => _KeteranganStepState();
}

class _KeteranganStepState extends State<KeteranganStep> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            // height: 23.0,
            decoration: BoxDecoration(
                color: Colors.greenAccent[700],
                borderRadius: BorderRadius.circular(4.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Keterangan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Helper.getAdaptiveText(context, 15.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Keterangan kejadian'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            maxLines: 5,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Masukkan keterangan kejadian...",
              hintStyle: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Kontak yang bisa dihubungi'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Cth: 081234567891",
              hintStyle: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildText(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            )),
      );
}

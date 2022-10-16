import 'package:cari_akang/data/gender.dart';
import 'package:cari_akang/presentation/widgets/labeled_radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataStep extends StatefulWidget {
  const DataStep({super.key});

  @override
  State<DataStep> createState() => _DataStepState();
}

class _DataStepState extends State<DataStep> {
  Gender? _gender = Gender.laki_laki;

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
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Isi Data',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Nama pelapor'),
        Form(
          child: TextFormField(
            style: const TextStyle(fontSize: 14.0),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan nama anda sebagai pelapor',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Nama korban'),
        Form(
          child: TextFormField(
            style: const TextStyle(fontSize: 14.0),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan nama korban hilang',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Umur'),
        Form(
          child: TextFormField(
            style: const TextStyle(fontSize: 14.0),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan umur korban hilang',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Alamat'),
        Form(
          child: TextFormField(
            style: const TextStyle(fontSize: 14.0),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan alamat korban',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Jenis kelamin'),
        Row(
          children: [
            LabeledRadio(
                label: 'Laki-laki',
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                groupValue: _gender!,
                value: Gender.laki_laki,
                onChanged: (Gender newGender) {
                  setState(() {
                    _gender = newGender;
                  });
                  // widget.genderValueCallback(newGender);
                }),
            LabeledRadio(
                label: 'Perempuan',
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                groupValue: _gender!,
                value: Gender.perempuan,
                onChanged: (Gender newGender) {
                  setState(() {
                    _gender = newGender;
                  });
                  // widget.genderValueCallback(newGender);
                })
          ],
        )
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

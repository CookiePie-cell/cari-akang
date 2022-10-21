import 'dart:developer';
import 'dart:io';

import 'package:cari_akang/utils/helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CiriCiriStep extends StatefulWidget {
  const CiriCiriStep({super.key});

  @override
  State<CiriCiriStep> createState() => _CiriCiriStepState();
}

class _CiriCiriStepState extends State<CiriCiriStep> {
  final List<String> warnaKulit = [
    'Putih',
    'Kuning langsat',
    'Sawo matang',
    'Cokelat kehitaman',
    'Hitam gelap',
  ];

  final List<String> jenisRambut = [
    'Tidak berambut',
    'Lurus',
    'Bergelombang',
    'Ikal',
    'Keriting'
  ];

  String? _selectedItem;

  XFile? _imageFile;

  dynamic _pickImageError;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
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
                  'Ciri-Ciri',
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
        _buildText('Tinggi badan (cm)'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan tinggi badan',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Berat badan (kg)'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan berat badan',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Warna kulit'),
        Form(
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            hint: Text(
              'Pilih warna kulit',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 12.0, right: 10.0),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: warnaKulit
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: Helper.getAdaptiveText(context, 13.0),
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              _selectedItem = value.toString();
            },
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Jenis rambut'),
        Form(
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            hint: Text(
              'Pilih jenis rambut:',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 12.0, right: 10.0),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: jenisRambut
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: Helper.getAdaptiveText(context, 13.0),
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value.toString();
              });
            },
            onSaved: (value) {
              _selectedItem = value.toString();
            },
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Warna rambut'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            decoration: InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                enabled: _selectedItem == 'Tidak berambut' ? false : true,
                hintText: _selectedItem == 'Tidak berambut'
                    ? '-'
                    : 'Cth: Hitam kecoklatan',
                border: const OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Lainnya'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            maxLines: 4,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Masukkan perawakan lainnya jika ada.",
              hintStyle: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Container(
          width: double.infinity,
          // height: 23.0,
          decoration: BoxDecoration(
              color: Colors.greenAccent[700],
              borderRadius: BorderRadius.circular(4.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Foto Teman/Kerabat yang Hilang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Helper.getAdaptiveText(context, 15.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Center(
          child: Column(
            children: [
              _imageFile == null
                  ? Container(
                      height: 180,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54)),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.black54),
                      ),
                    )
                  : Image.file(
                      File(_imageFile!.path),
                      width: 130,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text(
                  'Pilih foto',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
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

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = image!;
      });
    } catch (e) {
      log('error');
    }
  }
}

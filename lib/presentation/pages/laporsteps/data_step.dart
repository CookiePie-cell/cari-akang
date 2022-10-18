import 'package:cari_akang/data/gender.dart';
import 'package:cari_akang/presentation/widgets/labeled_radio.dart';
import 'package:cari_akang/utils/helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DataStep extends StatefulWidget {
  const DataStep({super.key});

  @override
  State<DataStep> createState() => _DataStepState();
}

class _DataStepState extends State<DataStep> {
  final List<String> provinsi = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];
  final List<String> kota = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  String? _selectedProvinsi, _selectedKota, _selectedTahunBulan = 'Tahun';
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Isi Data',
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
        _buildText('Nama pelapor'),
        Form(
          child: TextFormField(
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
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
            style: TextStyle(
              fontSize: Helper.getAdaptiveText(context, 13.0),
            ),
            decoration: const InputDecoration(
                // labelStyle: TextStyle(fontSize: 16.0),
                // labelText: 'Nama pelapor',
                hintText: 'Masukkan nama',
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Umur'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 240,
              child: Form(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: Helper.getAdaptiveText(context, 13.0),
                  ),
                  decoration: const InputDecoration(
                      // labelStyle: TextStyle(fontSize: 16.0),
                      // labelText: 'Nama pelapor',
                      hintText: 'Masukkan umur',
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Form(
                child: DropdownButtonFormField2(
                  value: _selectedTahunBulan,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(),
                  ),
                  isExpanded: true,
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
                  items: ['Tahun', 'Bulan']
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
                      _selectedTahunBulan = value.toString();
                    });
                  },
                  onSaved: (value) {
                    _selectedTahunBulan = value.toString();
                  },
                ),
              ),
            )
          ],
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
                'Alamat',
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
        _buildText('Provinsi'),
        Form(
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            hint: Text(
              'Pilih provinsi:',
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
            items: provinsi
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
                _selectedProvinsi = value.toString();
              });
            },
            onSaved: (value) {
              _selectedProvinsi = value.toString();
            },
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        _buildText('Kota/Kabupaten'),
        Form(
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            hint: Text(
              'Pilih kota/kabupaten:',
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
            items: kota
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
                _selectedProvinsi = value.toString();
              });
            },
            onSaved: (value) {
              _selectedProvinsi = value.toString();
            },
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

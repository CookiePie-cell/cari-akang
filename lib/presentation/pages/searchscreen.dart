import 'dart:developer';

import 'package:flutter/material.dart';

import '../../data/models/arguments.dart';
import '../../data/models/orang_hilang.dart';
import '../../data/models/orang_hilang_detail.dart';
import '../../utils/helper.dart';
import '../widgets/missing_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.isAuthenticated})
      : super(key: key);

  final bool isAuthenticated;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<OrangHilangDetail> data = [...orangHilangDetail];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_addQueryEvent);
  }

  void _addQueryEvent() {
    setState(() {
      if (_controller.text == '') {
        log('hello');
        data = [...orangHilangDetail];
      } else {
        // String tes = 'Roronoa Zoro';
        // log(tes
        //     .toLowerCase()
        //     .contains(_controller.text.toLowerCase())
        //     .toString());
        data = [...orangHilangDetail]
            .where((data) => data.namaOrangHilang
                .toLowerCase()
                .contains(_controller.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari',
            style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 25.0),
                color: Colors.white,
                shadows: const [
                  Shadow(
                      blurRadius: 6.0,
                      color: Colors.black45,
                      offset: Offset(0.0, 0.0))
                ])),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 32.0,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  List<OrangHilang> daftarLaporan = data
                      .map((detail) => OrangHilang(
                          id: detail.id,
                          namaPelapor: detail.namaPelapor,
                          nama: detail.namaOrangHilang,
                          jenisKelamin: detail.jenisKelamin,
                          umur: detail.umur,
                          tanggalPosting: detail.tanggalPosting,
                          imgUrl: detail.foto,
                          statusLaporan: detail.statusLaporan!))
                      .toList();
                  // log(daftarLaporan
                  //     .where((laporan) => laporan.id == '1')
                  //     .toList()[0]
                  //     .toString());
                  return MissingCard(
                    id: daftarLaporan[index].id,
                    nama: daftarLaporan[index].nama,
                    namaPelapor: daftarLaporan[index].namaPelapor,
                    umur: daftarLaporan[index].umur,
                    jenisKelamin: daftarLaporan[index].jenisKelamin,
                    onTap: () => Navigator.pushNamed(context, '/details',
                        arguments: ScreenArguments(
                            isAuthenticated: widget.isAuthenticated,
                            detailLaporan: orangHilangDetail
                                .where((data) =>
                                    data.id == daftarLaporan[index].id)
                                .toList()[0])),
                    imgURL: daftarLaporan[index].imgUrl,
                    tanggalPosting: daftarLaporan[index].tanggalPosting,
                    statusLaporan: daftarLaporan[index].statusLaporan,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

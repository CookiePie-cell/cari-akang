import 'dart:developer';

import 'package:cari_akang/data/models/arguments.dart';
import 'package:cari_akang/data/models/orang_hilang.dart';
import 'package:cari_akang/data/models/orang_hilang_detail.dart';
import 'package:cari_akang/data/status.dart';
import 'package:cari_akang/presentation/widgets/alert_dialog.dart';
import 'package:cari_akang/presentation/widgets/missing_card.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.isAuthenticated, Key? key}) : super(key: key);

  final bool isAuthenticated;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  late TabController _tabController;
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // log(widget.isAuthenticated.toString());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.greenAccent[700],
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CariAkang',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                      ),
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () {
                        widget.isAuthenticated
                            ? Navigator.pushNamed(context, '/notifications',
                                arguments: widget.isAuthenticated)
                            : showDialog<String>(
                                context: context,
                                builder: (context) => const MasukAlert());
                      }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 15.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    )),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: Colors.black87, width: 4.0),
                        insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
                      ),
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.black45,
                      labelStyle: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(
                          text: 'Hilang',
                        ),
                        Tab(
                          text: 'Ditemukan',
                        )
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: size.width * 0.9,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.black12),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: const Text(
                                'Pilih Provinsi',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black26),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: ((value) => setState(() {
                                    selectedValue = value as String;
                                  })),
                              buttonHeight: 40,
                              buttonWidth: 200,
                              itemHeight: 40,
                              searchController: textEditingController,
                              searchInnerWidget: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: 'Cari provinsi..',
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                return (item.value
                                    .toString()
                                    .contains(searchValue));
                              },
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textEditingController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        viewportFraction: 1,
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: orangHilangDetail.length,
                            itemBuilder: (context, index) {
                              List<OrangHilang> daftarLaporan =
                                  orangHilangDetail
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
                                onTap: () => Navigator.pushNamed(
                                    context, '/details',
                                    arguments: ScreenArguments(
                                        isAuthenticated: widget.isAuthenticated,
                                        detailLaporan: orangHilangDetail
                                            .where((data) =>
                                                data.id ==
                                                daftarLaporan[index].id)
                                            .toList()[0])),
                                imgURL: daftarLaporan[index].imgUrl,
                                tanggalPosting:
                                    daftarLaporan[index].tanggalPosting,
                                statusLaporan:
                                    daftarLaporan[index].statusLaporan,
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: found.length,
                            itemBuilder: (context, index) {
                              List<OrangHilang> daftarLaporan = ditemukan
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
                              return MissingCard(
                                id: daftarLaporan[index].id,
                                nama: daftarLaporan[index].nama,
                                namaPelapor: daftarLaporan[index].namaPelapor,
                                umur: daftarLaporan[index].umur!,
                                jenisKelamin: daftarLaporan[index].jenisKelamin,
                                onTap: () => Navigator.pushNamed(
                                    context, '/details',
                                    arguments: ScreenArguments(
                                        isAuthenticated: widget.isAuthenticated,
                                        detailLaporan: ditemukan
                                            .where((data) =>
                                                data.id ==
                                                daftarLaporan[index].id)
                                            .toList()[0])),
                                imgURL: daftarLaporan[index].imgUrl,
                                tanggalPosting:
                                    daftarLaporan[index].tanggalPosting,
                                statusLaporan:
                                    daftarLaporan[index].statusLaporan,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

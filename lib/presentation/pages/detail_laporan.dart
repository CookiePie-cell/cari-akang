import 'dart:developer';

import 'package:cari_akang/data/models/arguments.dart';
import 'package:cari_akang/data/models/orang_hilang_detail.dart';
import 'package:cari_akang/presentation/pages/detailsteps/detail_ciriciri_step.dart';
import 'package:cari_akang/presentation/pages/detailsteps/detail_data_step.dart';
import 'package:cari_akang/presentation/pages/detailsteps/detail_keterangan_step.dart';
import 'package:cari_akang/presentation/widgets/alert_dialog.dart';
import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailLaporanScreen extends StatefulWidget {
  const DetailLaporanScreen(
      {required this.isAuthenticated, required this.detailLaporan, Key? key})
      : super(key: key);

  final bool isAuthenticated;
  final OrangHilangDetail detailLaporan;
  @override
  State<DetailLaporanScreen> createState() => _DetailLaporanScreenState();
}

class _DetailLaporanScreenState extends State<DetailLaporanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> report = [
    'SARA',
    'Konten palsu',
    'Pencemaran nama baik',
    'lainnya'
  ];

  int _currentStep = 0;

  List<Step> get stepList => [
        Step(
            title: Text(
              'Data',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 16.0),
              ),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep >= 0,
            content: DetailDataStep(
              namaPelapor: widget.detailLaporan.namaPelapor,
              namaOrangHilang: widget.detailLaporan.namaOrangHilang,
              jenisKelamin: widget.detailLaporan.jenisKelamin,
              umur: widget.detailLaporan.umur,
              alamat: widget.detailLaporan.alamat,
            )),
        Step(
            title: Text(
              'Ciri-ciri',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 16.0),
              ),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 0,
            content: DetailCiriCiriStep(
              warnaKulit: widget.detailLaporan.warnaKulit,
              jenisRambut: widget.detailLaporan.jenisRambut,
              tinggiBadan: widget.detailLaporan.tinggiBadan,
              beratBadan: widget.detailLaporan.beratBadan,
              warnaRambut: widget.detailLaporan.warnaRambut,
              lainnya: widget.detailLaporan.lainnya,
            )),
        Step(
            title: Text(
              'Keterangan',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 16.0),
              ),
            ),
            state: _currentStep > 1 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 1,
            content: DetailKeteranganStep(
              kontak: widget.detailLaporan.kontak,
              keterangan: widget.detailLaporan.keterangan,
            )),
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    log(widget.detailLaporan.namaOrangHilang);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
        backgroundColor: Colors.greenAccent[700],
        body: SafeArea(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.6),
              width: double.infinity,
              height: size.height * 0.5,
              color: Colors.white,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/home',
                                  arguments: ScreenArguments(
                                      isAuthenticated: widget.isAuthenticated)),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ),
                            const Text(
                              'CariAkang',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          )),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            width: 100,
                            height: 4,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          const Text(
                            'INFORMASI TAMBAHAN',
                            style: TextStyle(
                                color: Color.fromARGB(178, 0, 0, 0),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Segoe UI'),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          SizedBox(
                            height: 200.0,
                            child: Container(
                              width: 150.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(widget.detailLaporan.foto),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => widget.isAuthenticated
                                    ? Navigator.pushNamed(context, '/chat')
                                    : showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const MasukAlert()),
                                icon: Icon(
                                  Icons.message,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  String noHp = widget.detailLaporan.kontak;
                                  final url = Uri.parse('tel:$noHp');

                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                              ),
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: Icon(
                              //     Icons.bookmark_add,
                              //     color: Colors.greenAccent[700],
                              //     size: 30.0,
                              //   ),
                              // ),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  log('Laporan berhasil dikirimm: $value');
                                },
                                icon: Icon(
                                  Icons.report_gmailerrorred,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                                itemBuilder: (context) => report
                                    .map<PopupMenuEntry<String>>(
                                        (String value) {
                                  return PopupMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                          Stepper(
                            physics: const ClampingScrollPhysics(),
                            controlsBuilder: (context, details) {
                              return Row(
                                children: [Container(), Container()],
                              );
                            },
                            type: StepperType.vertical,
                            currentStep: _currentStep,
                            steps: stepList,
                            onStepTapped: (index) {
                              setState(() {
                                _currentStep = index;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}


// DropdownButton<String>(
//                                 icon: Icon(
//                                   Icons.report_gmailerrorred,
//                                   color: Colors.greenAccent[700],
//                                   size: 30.0,
//                                 ),
//                                 underline: Container(),
//                                 onChanged: (value) {
//                                   log('Laporan berhasil dikirim');
//                                 },
//                                 items: report.map<DropdownMenuItem<String>>(
//                                     (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                               ),
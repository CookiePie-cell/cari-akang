import 'package:cari_akang/presentation/pages/detailsteps/detail_ciriciri_step.dart';
import 'package:cari_akang/presentation/pages/detailsteps/detail_data_step.dart';
import 'package:cari_akang/presentation/pages/detailsteps/detail_keterangan_step.dart';
import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class DetailLaporanScreen extends StatefulWidget {
  const DetailLaporanScreen({Key? key}) : super(key: key);

  @override
  State<DetailLaporanScreen> createState() => _DetailLaporanScreenState();
}

class _DetailLaporanScreenState extends State<DetailLaporanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currentStep = 1;

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
            content: const DetailDataStep()),
        Step(
            title: Text(
              'Ciri-ciri',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 16.0),
              ),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 0,
            content: const DetailCiriCiriStep()),
        Step(
            title: Text(
              'Keterangan',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 16.0),
              ),
            ),
            state: _currentStep > 1 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 1,
            content: const DetailKeteranganStep()),
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 20.0, right: 20.0),
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
                          onPressed: () => {},
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Komik-One-Piece-small.png'),
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.message,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_add,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.report_gmailerrorred,
                                  color: Colors.greenAccent[700],
                                  size: 30.0,
                                ),
                              ),
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

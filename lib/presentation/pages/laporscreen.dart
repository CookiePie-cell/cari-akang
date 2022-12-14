import 'dart:developer';

import 'package:cari_akang/data/models/arguments.dart';
import 'package:cari_akang/presentation/pages/laporsteps/ciri_ciri_step.dart';
import 'package:cari_akang/presentation/pages/laporsteps/data_step.dart';
import 'package:cari_akang/presentation/pages/laporsteps/keterangan_step.dart';
import 'package:cari_akang/presentation/widgets/alert_dialog.dart';
import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class LaporScreen extends StatefulWidget {
  const LaporScreen({required this.isAuthenticated, Key? key})
      : super(key: key);

  final bool isAuthenticated;
  @override
  State<LaporScreen> createState() => _LaporScreenState();
}

class _LaporScreenState extends State<LaporScreen> {
  int _currentStep = 0;

  List<Step> get stepList => [
        Step(
            title: Text(
              'Data',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep >= 0,
            content: const DataStep()),
        Step(
            title: Text(
              'Ciri-ciri',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 0,
            content: const CiriCiriStep()),
        Step(
            title: Text(
              'Keterangan',
              style: TextStyle(
                fontSize: Helper.getAdaptiveText(context, 13.0),
              ),
            ),
            state: _currentStep > 1 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 1,
            content: const KeteranganStep()),
      ];

  @override
  void initState() {
    super.initState();
    if (!widget.isAuthenticated) {
      Future.delayed(
          const Duration(milliseconds: 0),
          () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => MasukAlert(
                    onCancelPressed: () => Navigator.pushNamed(context, '/home',
                        arguments: ScreenArguments(isAuthenticated: false)),
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   color: Colors.white,
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text('Lapor',
              style: TextStyle(
                  fontSize: Helper.getAdaptiveText(context, 25.0),
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                        blurRadius: 6.0,
                        color: Colors.black45,
                        offset: Offset(0.0, 0.0))
                  ])),
        ),
      ),
      body: Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: controls.onStepCancel,
                    child: _currentStep > 0
                        ? Text(
                            "Kembali",
                            style: TextStyle(
                              fontSize: Helper.getAdaptiveText(context, 13.0),
                            ),
                          )
                        : Container()),
                ElevatedButton(
                  onPressed: controls.onStepContinue,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent[700]),
                      minimumSize: MaterialStateProperty.all(
                          Size(size.width * 0.25, size.height * 0.05)),
                      elevation: MaterialStateProperty.all(8.0)),
                  child: _currentStep < 2
                      ? Text('Lanjut',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Helper.getAdaptiveText(context, 13.0),
                          ))
                      : Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Helper.getAdaptiveText(context, 13.0),
                          ),
                        ),
                )
              ],
            ),
          );
        },
        type: StepperType.horizontal,
        steps: stepList,
        currentStep: _currentStep,
        onStepTapped: (index) {
          setState(() {
            _currentStep = index;
          });
        },
        onStepContinue: () {
          if (_currentStep < stepList.length - 1) {
            setState(() {
              _currentStep++;
            });
          } else {
            Navigator.popAndPushNamed(context, '/home',
                arguments:
                    ScreenArguments(isAuthenticated: widget.isAuthenticated));
          }
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
      ),
    );
  }
}

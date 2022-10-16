import 'package:cari_akang/presentation/pages/laporsteps/data_step.dart';
import 'package:flutter/material.dart';

class LaporScreen extends StatefulWidget {
  const LaporScreen({Key? key}) : super(key: key);

  @override
  State<LaporScreen> createState() => _LaporScreenState();
}

class _LaporScreenState extends State<LaporScreen> {
  int _currentStep = 0;

  List<Step> get stepList => [
        Step(
            title: const Text(
              'Data',
              style: TextStyle(fontSize: 14.0),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep >= 0,
            content: const DataStep()),
        Step(
            title: const Text(
              'Ciri-ciri',
              style: TextStyle(fontSize: 14.0),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 0,
            content: const Center(
              child: Text('Hello'),
            )),
        Step(
            title: const Text(
              'Kontak',
              style: TextStyle(fontSize: 14.0),
            ),
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
            isActive: _currentStep > 1,
            content: const Center(
              child: Text('Hello'),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Lapor',
            style: TextStyle(fontSize: 26.0, color: Colors.white, shadows: [
              Shadow(
                  blurRadius: 6.0,
                  color: Colors.black45,
                  offset: Offset(0.0, 0.0))
            ])),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: stepList,
        currentStep: _currentStep,
        onStepTapped: (index) {
          setState(() {
            _currentStep = index;
          });
        },
      ),
    );
  }
}

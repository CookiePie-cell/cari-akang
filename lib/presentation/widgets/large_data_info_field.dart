import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class LargeDataInfoField extends StatelessWidget {
  const LargeDataInfoField(
      {required this.label, required this.value, super.key});

  final String label, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 6.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Helper.getAdaptiveText(context, 14.0),
              color: const Color.fromARGB(178, 0, 0, 0),
            ),
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(8.0)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, bottom: 4, right: 12.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        value,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: Helper.getAdaptiveText(context, 14.0),
                          color: const Color.fromARGB(178, 0, 0, 0),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

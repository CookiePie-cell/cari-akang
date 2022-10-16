import 'package:cari_akang/data/gender.dart';
import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final Gender groupValue;
  final Gender value;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<Gender>(
              groupValue: groupValue,
              value: value,
              onChanged: (Gender? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label, style: const TextStyle(fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}

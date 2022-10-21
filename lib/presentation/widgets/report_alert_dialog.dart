import 'package:flutter/material.dart';

class MasukAlert extends StatelessWidget {
  const MasukAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: const Text('Masuk terlebih dahulu'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          child: const Text('Masuk'),
        ),
      ],
    );
  }
}

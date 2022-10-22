import 'package:flutter/material.dart';

class MasukAlert extends StatelessWidget {
  const MasukAlert({this.onCancelPressed, Key? key}) : super(key: key);

  final VoidCallback? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: const Text('Masuk terlebih dahulu'),
      actions: <Widget>[
        TextButton(
          onPressed: onCancelPressed ?? () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/login'),
          child: const Text('Masuk'),
        ),
      ],
    );
  }
}

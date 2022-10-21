import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
    required this.onButtonPressed,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.08,
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromARGB(255, 36, 197, 30)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ))),
        child: Text(buttonName,
            style:
                const TextStyle(fontSize: 22, color: Colors.white, height: 1.5)
                    .copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

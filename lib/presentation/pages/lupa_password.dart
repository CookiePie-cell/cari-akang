import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/rounded_button.dart';
import '../widgets/text_input_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromARGB(172, 8, 241, 0),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Lupa Password',
              style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      child: const Text(
                        'Masukan Email Anda Untuk Mereset Password Anda',
                        style: TextStyle(
                            fontSize: 22, color: Colors.white, height: 1.5),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      buttonName: 'Send',
                      onButtonPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

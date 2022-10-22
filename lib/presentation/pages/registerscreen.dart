import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/password_input_field.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_input_field.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 34.0,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(237, 9, 192, 18),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width * 0.1,
              ),
              Column(
                children: [
                  const TextInputField(
                    icon: FontAwesomeIcons.user,
                    hint: 'Nama User',
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                  ),
                  const TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  const PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.next,
                  ),
                  const PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Konfirmasi Password',
                    inputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Daftar',
                    onButtonPressed: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah Punya Akun',
                        style: TextStyle(
                            fontSize: 18.0, color: Colors.white, height: 1.5),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Masuk',
                          style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  height: 1.5)
                              .copyWith(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

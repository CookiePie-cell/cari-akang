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
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromARGB(237, 9, 192, 18),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.2,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor: Colors.grey[400]!.withOpacity(
                                0.4,
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.white,
                                size: size.width * 0.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.08,
                        left: size.width * 0.56,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 36, 197, 30),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.arrowUp,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
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
                                fontSize: 18.0,
                                color: Colors.white,
                                height: 1.5),
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
        )
      ],
    );
  }
}

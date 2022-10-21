import 'package:cari_akang/data/models/arguments.dart';
import 'package:flutter/material.dart';
import '../widgets/password_input_field.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(172, 8, 241, 0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/home',
              arguments: ScreenArguments(isAuthenticated: false)),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 34.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CariAkang',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 28.0,
                ),
                const TextInputField(
                  icon: Icons.email,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                ),
                const PasswordInput(
                  icon: Icons.key,
                  hint: 'Password',
                  inputAction: TextInputAction.done,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/lupa-password'),
                  child: const Text(
                    'Lupa Password',
                    style: TextStyle(
                        fontSize: 22, color: Colors.white, height: 1.5),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                RoundedButton(
                  buttonName: 'Login',
                  onButtonPressed: () => Navigator.pushNamed(context, '/home',
                      arguments: ScreenArguments(isAuthenticated: true)),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/register'),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white))),
                child: const Text(
                  'Buat Akun Baru',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

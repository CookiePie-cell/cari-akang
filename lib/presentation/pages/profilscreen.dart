import 'dart:developer';

import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen>
    with SingleTickerProviderStateMixin {
  bool _isEdit = false;
  bool _isLogin = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.greenAccent[700],
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            width: double.infinity,
            height: size.height,
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CariAkang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                      ),
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 15.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          )),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            width: 100,
                            height: 4,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          const Text(
                            'Akun Saya',
                            style: TextStyle(
                                color: Color.fromARGB(178, 0, 0, 0),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Segoe UI'),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          const CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                                'assets/images/Komik-One-Piece-small.png'),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              log(_isLogin.toString());
                              _isLogin
                                  ? setState(() {
                                      _isEdit = !_isEdit;
                                    })
                                  : setState(() {
                                      _isLogin = !_isLogin;
                                      Navigator.pushNamed(context, '/login');
                                    });
                            },
                            child: Text(
                              _isLogin
                                  ? _isEdit
                                      ? 'Simpan'
                                      : 'Edit Profile'
                                  : 'Masuk',
                              style: TextStyle(
                                  fontSize:
                                      Helper.getAdaptiveText(context, 14.0),
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Form(
                              child: TextFormField(
                                enabled: _isEdit ? true : false,
                                initialValue: 'Utu Dodutu',
                                style: TextStyle(
                                    fontSize:
                                        Helper.getAdaptiveText(context, 14)),
                                decoration: const InputDecoration(
                                  label: Text('Nama'),
                                  icon: Icon(
                                    Icons.person,
                                    size: 34.0,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  log("$value saved");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Form(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                enabled: _isEdit ? true : false,
                                initialValue: 'utudodutu@gmail.com',
                                style: TextStyle(
                                    fontSize:
                                        Helper.getAdaptiveText(context, 14)),
                                decoration: const InputDecoration(
                                  label: Text('Email'),
                                  icon: Icon(
                                    Icons.email,
                                    size: 30.0,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  log("$value saved");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Form(
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                enabled: _isEdit ? true : false,
                                initialValue: '081234567890',
                                style: TextStyle(
                                    fontSize:
                                        Helper.getAdaptiveText(context, 14)),
                                decoration: const InputDecoration(
                                  label: Text('Kontak'),
                                  icon: Icon(
                                    Icons.phone,
                                    size: 30.0,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  log("$value saved");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Form(
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                enabled: _isEdit ? true : false,
                                initialValue: 'abcd123',
                                style: TextStyle(
                                    fontSize:
                                        Helper.getAdaptiveText(context, 14)),
                                decoration: const InputDecoration(
                                  label: Text('Password'),
                                  icon: Icon(
                                    Icons.key,
                                    size: 30.0,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  log("$value saved");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  // fixedSize: MaterialStatePropertyAll(
                                  //     Size.fromWidth(size.width)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.redAccent)),
                              child: Text(
                                'Keluar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        Helper.getAdaptiveText(context, 16.0)),
                              ),
                            ),
                          )
                        ],
                      )))
            ]),
          ),
        ]));
  }
}

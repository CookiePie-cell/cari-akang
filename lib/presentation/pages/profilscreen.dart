import 'dart:developer';
import 'dart:io';

import 'package:cari_akang/data/models/arguments.dart';
import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/alert_dialog.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({required this.isAuthenticated, Key? key})
      : super(key: key);

  final bool isAuthenticated;
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen>
    with SingleTickerProviderStateMixin {
  bool _isEdit = false;
  bool _isLogin = true;

  XFile? _imageFile;

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
                      onPressed: () {
                        widget.isAuthenticated
                            ? Navigator.pushNamed(context, '/notifications',
                                arguments: widget.isAuthenticated)
                            : showDialog<String>(
                                context: context,
                                builder: (context) => const MasukAlert());
                      },
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
                          Text(
                            widget.isAuthenticated
                                ? 'Akun Saya'
                                : 'Anda belum masuk',
                            style: const TextStyle(
                                color: Color.fromARGB(178, 0, 0, 0),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Segoe UI'),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          widget.isAuthenticated
                              ? Center(
                                  child: Stack(children: [
                                    CircleAvatar(
                                      radius: 70,
                                      backgroundImage: _imageFile == null
                                          ? const AssetImage(
                                              'assets/images/Komik-One-Piece-small.png')
                                          : Image.file(File(_imageFile!.path))
                                              .image,
                                    ),
                                    _isEdit
                                        ? Positioned(
                                            bottom: 0.0,
                                            right: 8.0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromARGB(
                                                      220, 255, 255, 255)),
                                              child: IconButton(
                                                onPressed: _pickImage,
                                                icon: Icon(
                                                  Icons.upload,
                                                  size: 32.0,
                                                  color:
                                                      Colors.greenAccent[700],
                                                ),
                                              ),
                                            ))
                                        : Positioned(
                                            bottom: 0.0,
                                            right: 8.0,
                                            child: Container(),
                                          )
                                  ]),
                                )
                              : const Icon(
                                  Icons.person_outline,
                                  color: Color.fromARGB(50, 0, 0, 0),
                                  size: 200,
                                ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              log(widget.isAuthenticated.toString());
                              widget.isAuthenticated
                                  ? setState(() {
                                      _isEdit = !_isEdit;
                                    })
                                  : setState(() {
                                      Navigator.pushNamed(context, '/login');
                                    });
                            },
                            style: const ButtonStyle(
                                minimumSize:
                                    MaterialStatePropertyAll(Size(100, 36))),
                            child: Text(
                              widget.isAuthenticated
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
                            height: 12.0,
                          ),
                          !widget.isAuthenticated
                              ? ElevatedButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/register'),
                                  style: const ButtonStyle(
                                      minimumSize: MaterialStatePropertyAll(
                                          Size(100.0, 36.0))),
                                  child: const Text(
                                    'Daftar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Container(),
                          const SizedBox(
                            height: 24.0,
                          ),
                          widget.isAuthenticated
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Form(
                                        child: TextFormField(
                                          enabled: _isEdit ? true : false,
                                          initialValue: 'Utu Dodutu',
                                          style: TextStyle(
                                              fontSize: Helper.getAdaptiveText(
                                                  context, 14)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Form(
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          enabled: _isEdit ? true : false,
                                          initialValue: 'utudodutu@gmail.com',
                                          style: TextStyle(
                                              fontSize: Helper.getAdaptiveText(
                                                  context, 14)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Form(
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          enabled: _isEdit ? true : false,
                                          initialValue: '081234567890',
                                          style: TextStyle(
                                              fontSize: Helper.getAdaptiveText(
                                                  context, 14)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Form(
                                        child: TextFormField(
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          enabled: _isEdit ? true : false,
                                          initialValue: 'abcd123',
                                          style: TextStyle(
                                              fontSize: Helper.getAdaptiveText(
                                                  context, 14)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, '/home',
                                            arguments: ScreenArguments(
                                                isAuthenticated: false)),
                                        style: const ButtonStyle(
                                            // fixedSize: MaterialStatePropertyAll(
                                            //     Size.fromWidth(size.width)),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.redAccent)),
                                        child: Text(
                                          'Keluar',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Helper.getAdaptiveText(
                                                  context, 16.0)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Container(),
                        ],
                      )))
            ]),
          ),
        ]));
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = image!;
      });
    } catch (e) {
      log('error');
    }
  }
}

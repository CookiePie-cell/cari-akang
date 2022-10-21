import 'package:cari_akang/data/models/arguments.dart';
import 'package:cari_akang/presentation/pages/homescreen.dart';
import 'package:cari_akang/presentation/pages/laporscreen.dart';
import 'package:cari_akang/presentation/pages/profilscreen.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({required this.arguments, Key? key}) : super(key: key);

  final ScreenArguments arguments;
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions = [
    HomeScreen(
      isAuthenticated: widget.arguments.isAuthenticated!,
    ),
    LaporScreen(
      isAuthenticated: widget.arguments.isAuthenticated!,
    ),
    // const BookmarkScreen(),
    ProfilScreen(
      isAuthenticated: widget.arguments.isAuthenticated!,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Beranda',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.report_gmailerrorred_outlined,
              color: Colors.black,
            ),
            label: 'Lapor',
            backgroundColor: Colors.white,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.bookmark,
          //     color: Colors.black,
          //   ),
          //   label: 'Bookmark',
          //   backgroundColor: Colors.white,
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            label: 'Akun',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

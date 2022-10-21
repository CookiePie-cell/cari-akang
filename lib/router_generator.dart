import 'package:cari_akang/main.dart';
import 'package:cari_akang/navigation.dart';
import 'package:cari_akang/presentation/pages/lupa_password.dart';
import 'package:cari_akang/presentation/pages/detail_laporan.dart';
import 'package:cari_akang/presentation/pages/loginscreen.dart';
import 'package:cari_akang/presentation/pages/messagescreen.dart';
import 'package:cari_akang/presentation/pages/notificationscreen.dart';
import 'package:cari_akang/presentation/pages/registerscreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyApp());
      case '/details':
        return MaterialPageRoute(builder: (_) => const DetailLaporanScreen());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ChatRoomView());
      case '/register':
        return MaterialPageRoute(builder: (_) => const CreateNewAccount());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/lupa-password':
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}

import 'package:cari_akang/navigation.dart';
import 'package:cari_akang/presentation/pages/detail_laporan.dart';
import 'package:cari_akang/presentation/pages/notificationscreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const NavigationPage());
      case '/details':
        return MaterialPageRoute(builder: (_) => const DetailLaporanScreen());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
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

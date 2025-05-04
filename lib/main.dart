import 'package:flutter/material.dart';
import 'package:etotek_mobil/core/init/app_init.dart';
import 'package:etotek_mobil/services/shared_prefs_service.dart';
import 'package:etotek_mobil/ui/view/home/home_view.dart';
import 'package:etotek_mobil/ui/view/login/login_view.dart';

void main() async {
  await AppInit.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedIn = SharedPrefsService().token != null;
    return MaterialApp(
      home: loggedIn ? const HomeView() : const LoginView(),
    );
  }
}

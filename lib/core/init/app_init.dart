import 'package:flutter/material.dart';
import 'package:etotek_mobil/services/base/http_base.dart';
import 'package:etotek_mobil/services/shared_prefs_service.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPrefsService().init();
    HttpBase(token: SharedPrefsService().token);
  }
}

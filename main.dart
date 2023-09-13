import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organiser/constants/controllers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organiser/controllers/auth_controller.dart';

import 'controllers/theme_controller.dart';
import 'view/screens/AuthScreen/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(
      ThemeController(),
    );
    Get.put(AuthController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ebefa',
      debugShowCheckedModeBanner: false,
      theme: themeController.theme,
      home: const AuthScreen(),
    );
  }
}

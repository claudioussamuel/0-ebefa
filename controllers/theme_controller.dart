import 'package:get/get.dart';
import 'package:organiser/constants/theme.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();
  final theme = EbefaTheme.dark();
}

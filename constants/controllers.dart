import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organiser/controllers/theme_controller.dart';

import '../controllers/auth_controller.dart';

ThemeController themeController = ThemeController.instance;

final Future<FirebaseApp> intialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// FirebaseStorage firebaseStorage = FirebaseStorage.instance;

AuthController authController = AuthController.instance;
// ticketController tickController = ticketController.instance;
// UsersBoughtController usersBoughtController = UsersBoughtController.instance;
// DateController controller = DateController.instance;


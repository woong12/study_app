import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/bindings/initial_bindings.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DataUploaderScreen(),
//     ),
//   );
// }

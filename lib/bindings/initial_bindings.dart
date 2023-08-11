import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';

import '../controllers/question_paper/question_paper_controller.dart';
import '../services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut(() => FirebaseStorageService());
    // Get.put(QuestionPaperController());
    Get.lazyPut(() => QuestionPaperController());
    Get.put(AuthController(), permanent: true);
  }
}

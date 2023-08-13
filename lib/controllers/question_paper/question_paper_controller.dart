import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';
import '../../screens/question/question_screen.dart';
import '../../services/firebase_storage_service.dart';
import '../../utils/app_logger.dart';
import '../auth_controller.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestion({
    required QuestionPaperModel paper,
    bool tryAgain = false,
  }) {
    AuthController authController = Get.find();
    if (authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed();
      } else {
        print("Logged in");
        Get.toNamed(QuestionScreen.routeName, arguments: paper);
      }
    } else {
      print("The title is ${paper.title}");
      authController.showLoginAlertDialogue();
    }
  }
}

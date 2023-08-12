import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/services/firebase_storage_service.dart';

import '../../firebase_ref/references.dart';

class QuestionPaperController extends GetxController {
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  Future<void> getAllPapers() async {
    // List<String> imgName = [
    //   "biology",
    //   "chemistry",
    //   "maths",
    //   "physics",
    // ];
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
      Logger().e(e);
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
        //Get.toNamed();
      }
    } else {
      print("The title is ${paper.title}");
      authController.showLoginAlertDialogue();
    }
  }
}

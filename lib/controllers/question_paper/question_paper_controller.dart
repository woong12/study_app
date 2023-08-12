import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';
import '../../services/firebase_storage_service.dart';
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

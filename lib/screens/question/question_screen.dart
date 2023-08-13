import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/configs/themes/custom_text_styles.dart';
import 'package:study/firebase_ref/loading_status.dart';
import 'package:study/widgets/common/background_decoration.dart';
import 'package:study/widgets/common/question_placeholder.dart';
import 'package:study/widgets/content_area.dart';

import '../../controllers/question_paper/questions_controller.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});

  static const String routeName = "/questionscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                  child: ContentArea(child: QuestionPlaceholder()),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              controller.currentQuestion.value!.question,
                              style: questionTS,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

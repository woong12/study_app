import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/firebase_ref/loading_status.dart';
import 'package:study/widgets/common/background_decoration.dart';

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
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                                controller.currentQuestion.value!.question)),
                      ],
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

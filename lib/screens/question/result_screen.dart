import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:study/controllers/question_paper/questions_controller_extension.dart';

import '../../controllers/question_paper/questions_controller.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});

  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        controller.correctQuestionCount.toString(),
      ),
    ));
  }
}

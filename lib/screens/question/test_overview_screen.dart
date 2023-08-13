import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:study/controllers/question_paper/questions_controller.dart';
import 'package:study/widgets/common/background_decoration.dart';
import 'package:study/widgets/common/custom_app_bar.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});

  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Test over",
      ),
      body: BackgroundDecoration(
        child: Center(
          child: Text("asd"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/configs/themes/custom_text_styles.dart';
import 'package:study/configs/themes/ui_parameters.dart';
import 'package:study/controllers/question_paper/questions_controller.dart';
import 'package:study/widgets/common/background_decoration.dart';
import 'package:study/widgets/common/custom_app_bar.dart';
import 'package:study/widgets/common/main_button.dart';
import 'package:study/widgets/content_area.dart';
import 'package:study/widgets/questions/answer_card.dart';
import 'package:study/widgets/questions/countdown_timer.dart';
import 'package:study/widgets/questions/question_number_card.dart';

import '../../configs/themes/app_colors.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});

  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CountdownTimer(
                          color: UIParameters.isDarkMode()
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Theme.of(context).primaryColor,
                          time: '',
                        ),
                        Obx(
                          () => Text(
                            '${controller.time} Remaining',
                            style: countdownTimerTS(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.allQuestions.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width ~/ 75,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (_, index) {
                          AnswerStatus? answerStatus;
                          if (controller.allQuestions[index].selectedAnswer !=
                              null) {
                            answerStatus = AnswerStatus.answered;
                          }
                          return QuestionNumberCard(
                            index: index + 1,
                            status: answerStatus,
                            onTap: () => controller.jumpToQuestion(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: UIParameters.mobileScreenPadding,
              decoration: BoxDecoration(
                color: customScaffoldColor(context),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: ColoredBox(
                color: customScaffoldColor(context),
                child: Padding(
                  padding: UIParameters.mobileScreenPadding / 2,
                  child: MainButton(
                    onTap: () {
                      controller.complete();
                    },
                    title: "Complete",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

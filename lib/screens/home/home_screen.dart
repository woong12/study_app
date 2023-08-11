import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: SizedBox(
                width: 200,
                height: 200,
                child:

                    //  FadeInImage(
                    //   image: NetworkImage(
                    //       _questionPaperController.allPaperImages[index]),
                    //   placeholder:
                    //       const AssetImage("assets/images/app_splash_logo.png"),
                    // ),

                    CachedNetworkImage(
                  imageUrl: questionPaperController.allPapers[index].imageUrl!,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child:
                        const CircularProgressIndicator(), // you can add pre loader image as well show loading
                  ), // show progress while loading image
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/app_splash_logo.png"),
                  // show no image available image on error loading
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
          // itemCount: _questionPaperController.allPaperImages.length,
          itemCount: questionPaperController.allPapers.length,
        ),
      ),
    );
  }
}

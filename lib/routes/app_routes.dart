import 'package:get/get.dart';
import 'package:study/controllers/question_paper/questions_controller.dart';
import 'package:study/screens/login/login_screen.dart';
import 'package:study/screens/question/question_screen.dart';
import 'package:study/screens/question/result_screen.dart';
import 'package:study/screens/question/test_overview_screen.dart';

import '../controllers/question_paper/question_paper_controller.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/introduction",
          page: () => const IntroductionScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: QuestionScreen.routeName,
          page: () => const QuestionScreen(),
          binding: BindingsBuilder(
            () {
              Get.put<QuestionsController>(QuestionsController());
            },
          ),
        ),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
      ];
}

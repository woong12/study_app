import 'package:flutter/material.dart';
import 'package:study/widgets/common/background_decoration.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  static const String routeName = "/questionscreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundDecoration(
        child: Center(
          child: Text("sadfadsf"),
        ),
      ),
    );
  }
}

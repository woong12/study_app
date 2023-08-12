import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';

import '../../configs/themes/app_colors.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: onSurfaceTextColor,
          ),
        )),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

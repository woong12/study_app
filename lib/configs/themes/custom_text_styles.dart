import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/configs/themes/ui_parameters.dart';

import 'app_colors.dart';

TextStyle cardTtitle(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyLarge!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const questionTS = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

const detailText = TextStyle(
  fontSize: 12,
);

const headerText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);

const appBarTS = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: onSurfaceTextColor,
);

TextStyle countdownTimerTS() => TextStyle(
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: UIParameters.isDarkMode()
          ? Theme.of(Get.context!).textTheme.bodyLarge!.color
          : Theme.of(Get.context!).primaryColor,
    );

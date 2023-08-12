import 'package:flutter/material.dart';
import 'package:study/configs/themes/ui_parameters.dart';

import 'app_colors.dart';

TextStyle cardTtitle(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyLarge!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(
  fontSize: 12,
);
const headerText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);

import 'package:debt_example/config/constants/app_colors.dart';
import 'package:debt_example/config/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'ВЗЯТЬ',
          style: AppTextStyles.head25w9,
        ),
        TextSpan(
          text: 'ЗАЙМ',
          style: AppTextStyles.head25w9.copyWith(
            color: AppColors.greenColor,
          ),
        ),
      ]),
    );
  }
}

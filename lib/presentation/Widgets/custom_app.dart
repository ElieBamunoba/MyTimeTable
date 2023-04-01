import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/theme.dart';
import 'Widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: AppConstants.padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(
              color: AppColors.darkBlue,
              width: 1,
            ),
          ),
          child: const TitleText(
            text: 'My TimeTable',
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.darkBlue,
              style: BorderStyle.none,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(13)),
          ),
          child: const Icon(
            Icons.notifications,
            color: AppColors.darkBlue,
          ),
        )
      ],
    );
  }
}

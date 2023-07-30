import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/loading2.gif',
                height: 250,
              ),
            ),
            Text('Making the magic happen! 😎',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 22, color: AppColors.darkBlue))
          ],
        ));
  }
}

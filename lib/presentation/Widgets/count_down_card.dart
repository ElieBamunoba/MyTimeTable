import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CountDownCard extends StatelessWidget {
  const CountDownCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: AppColors.ligthBlue2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.darkBlue)),
        child: Container(
          height: size.height * .2,
          width: double.infinity,
          color: AppColors.darkBlue,
          child: Column(
            children: [
              Text(
                'Are you ready for exam?',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
              )
            ],
          ),
        ));
  }
}

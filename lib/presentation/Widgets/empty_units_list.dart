import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyUnitsList extends StatelessWidget {
  const EmptyUnitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        'You haven\'t saved any units yet',
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
      ),
      const SizedBox(height: 20),
      SvgPicture.asset("assets/nodata.svg", height: 150)
    ]);
  }
}

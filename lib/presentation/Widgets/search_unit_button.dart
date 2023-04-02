import 'package:flutter/material.dart';

import 'modal_bottom_sheet.dart';

class SearchUnitButton extends StatelessWidget {
  const SearchUnitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(double.infinity, 50)),
          onPressed: () => showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: (BuildContext context) => const ModalBottomSheet()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Search for your units",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 18),
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ],
          )),
    );
  }
}

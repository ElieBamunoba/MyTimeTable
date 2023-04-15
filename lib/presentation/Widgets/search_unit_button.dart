import 'package:flutter/material.dart';

import './modal_bottom_sheet.dart';

class SearchUnitButton extends StatelessWidget {
  const SearchUnitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              fixedSize: const Size(double.infinity, 60)),
          onPressed: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              builder: (BuildContext context) => const ModalBottomSheet()),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Search for your units",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 18)),
            const Icon(Icons.search, color: Colors.white, size: 30)
          ])),
    );
  }
}

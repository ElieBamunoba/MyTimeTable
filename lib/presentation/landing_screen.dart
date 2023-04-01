import 'package:exam_time_table/bloc/saved_units/saved_units_bloc.dart';
import 'package:exam_time_table/presentation/widgets/unit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';
import './widgets/modal_bottom_sheet.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SavedUnitsBloc>().add(LoadSavedUnits());
    return Scaffold(
        backgroundColor: AppColors.backgroundLigthGrey,
        appBar: AppBar(
          title: const Text('My TimeTable'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important_outlined))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 70,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome Freind !',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              SizedBox(
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
                        builder: (BuildContext context) =>
                            const ModalBottomSheet()),
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
              ),
              const SizedBox(height: 20),
              BlocBuilder<SavedUnitsBloc, SavedUnitsState>(
                builder: (context, state) {
                  if (state is SavedUnitsLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else if (state is SavedUnitsLoaded) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<SavedUnitsBloc>().add(LoadSavedUnits());
                        },
                        child: ListView.builder(
                            itemCount: state.savedUnitsList.length,
                            itemBuilder: (context, index) {
                              return SavedUnitCard(
                                  unit: state.savedUnitsList[index]);
                            }),
                      ),
                    );
                  } else {
                    return const Center(child: Text('Something Wrong happen'));
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './constants/theme.dart';

import 'business_logic/logic.dart';
import 'repository/saved_units/saved_units_repository.dart';
import 'repository/unit/unit_repository.dart';
import 'constants/route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UnitRepository>(create: (_) => UnitRepository()),
        RepositoryProvider<SavedUnitsRepository>(
            create: (_) => SavedUnitsRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UnitBloc>(
              create: (context) => UnitBloc(unitRepository: UnitRepository())),
          BlocProvider<SavedUnitsBloc>(
              create: (context) => SavedUnitsBloc(
                    savedUnitsRepository: SavedUnitsRepository(),
                    unitRepository: UnitRepository(),
                  )),
        ],
        child: MaterialApp(
            title: 'MyTimeTable',
            debugShowCheckedModeBanner: false,
            theme: themeData(),
            onGenerateRoute: route.onGeneratedRoute,
            initialRoute: route.landingScreen),
      ),
    );
  }
}

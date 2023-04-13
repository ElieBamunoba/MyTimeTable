import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './constants/theme.dart';
import 'bloc/saved_units/saved_units_bloc.dart';
import 'repository/saved_units/saved_units_repository.dart';
import 'repository/unit/unit_repository.dart';
import './route.dart' as route;
import 'bloc/unit/unit_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
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
              create: (context) =>
                  SavedUnitsBloc(savedUnitsRepository: SavedUnitsRepository())),
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

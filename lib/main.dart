import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './constants/theme.dart';
import './repository/unit_repository.dart';
import './route.dart' as route;
import 'bloc/unit/unit_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UnitRepository>(create: (_) => UnitRepository())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UnitBloc>(
                create: (context) =>
                    UnitBloc(unitRepository: UnitRepository())),
          ],
          child: MaterialApp(
              title: 'MyTimeTable',
              debugShowCheckedModeBanner: false,
              theme: themeData(),
              onGenerateRoute: route.onGeneratedRoute,
              initialRoute: route.landingScreen),
        ));
  }
}

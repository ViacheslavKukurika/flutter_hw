import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hw/lesson_18/homework_%D1%81ubit/counter_cubit.dart';
import 'package:flutter_hw/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_hw/router/app_router.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => CounterCubit()),
      BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
    );
  }
}

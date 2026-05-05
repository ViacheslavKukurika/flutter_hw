import 'package:flutter_hw/home_screen.dart';
import 'package:flutter_hw/lesson_11/homework_11_screen.dart';
import 'package:flutter_hw/lesson_12/homework_12_screen.dart';
import 'package:flutter_hw/lesson_13/homework_13_screen.dart';
import 'package:flutter_hw/router/app_routes.dart';
import 'package:flutter_hw/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutesPaths.home,
  routes: [
    GoRoute(
      path: AppRoutesPaths.home,
      name: AppRoutesNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutesPaths.homeworks,
      name: AppRoutesNames.homeworks,
      builder: (context, state) => const WidgetsScreen(),
    ),
    GoRoute(
      path: AppRoutesPaths.homework7,
      name: AppRoutesNames.homework7,
      builder: (context, state) => const Homework11Screen(),
    ),
    GoRoute(
      path: AppRoutesPaths.homework8,
      name: AppRoutesNames.homework8,
      builder: (context, state) => const Homework12Screen(),
    ),
    GoRoute(
      path: AppRoutesPaths.homework9,
      name: AppRoutesNames.homework9,
      builder: (context, state) => const WidgetConstrainsTrainingScreen(),
    ),
  ],
);

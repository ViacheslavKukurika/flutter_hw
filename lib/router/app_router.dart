import 'package:flutter_hw/home_screen.dart';
import 'package:flutter_hw/lesson_11/homework_11_screen.dart';
import 'package:flutter_hw/lesson_12/homework_12_screen.dart';
import 'package:flutter_hw/lesson_13/homework_13_screen.dart';
import 'package:flutter_hw/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_hw/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:flutter_hw/lesson_18/state_managment_base_screen.dart';
import 'package:flutter_hw/lesson_19/screens/rate_app_screen.dart';
import 'package:flutter_hw/lesson_21/ex_animation_screen.dart';
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
      routes: [
        GoRoute(
          path: AppRoutesPaths.homeworks,
          name: AppRoutesNames.homeworks,
          builder: (context, state) => const WidgetsScreen(),
          routes: [
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
              builder: (context, state) =>
                  const WidgetConstrainsTrainingScreen(),
            ),
            GoRoute(
              path: AppRoutesPaths.homework11,
              name: AppRoutesNames.homework11,
              builder: (context, state) => const StateManagmentBaseScreen(),
              routes: [
                GoRoute(
                  path: AppRoutesPaths.homework11Cubit,
                  name: AppRoutesNames.homework11Cubit,
                  builder: (context, state) => const HomeworkCubitScreen(),
                ),
                GoRoute(
                  path: AppRoutesPaths.homework11Bloc,
                  name: AppRoutesNames.homework11Bloc,
                  builder: (context, state) => const HomeworkBlocScreen(),
                ),
              ],
            ),
            GoRoute(
              path: AppRoutesPaths.homework12,
              name: AppRoutesNames.homework12,
              builder: (context, state) => const RateAppScreen(),
            ),
            GoRoute(
              path: AppRoutesPaths.homework13,
              name: AppRoutesNames.homework13,
              builder: (context, state) => const ExAnimationScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

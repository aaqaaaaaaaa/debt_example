import 'package:debt_example/presentation/pages/home_page/presentation/manager/debt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/dependency_injection.dart';
import '../pages/home_page/presentation/pages/home_page.dart';

class Routes {
  static const homePage = '/homePage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case homePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const HomePage(),
          );
        default:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => di<DebtCubit>(),
            child: const HomePage(),
            ),
            settings: routeSettings,
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    }
  }
}

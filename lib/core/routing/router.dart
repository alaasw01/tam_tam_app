import 'package:flutter/material.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/views/home/home_view.dart';
import 'package:tam_tam_app/views/auth/auth_view.dart';
import 'package:tam_tam_app/views/initial_and_select_lang/initial_view.dart';
import 'package:tam_tam_app/views/initial_and_select_lang/select_language_view.dart';
import 'package:tam_tam_app/views/splash/splash_view.dart';

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteNames.auth:
        return MaterialPageRoute(builder: (_) => const AuthView());
      case RouteNames.initial:
        return MaterialPageRoute(builder: (_) => const InitialView());
      case RouteNames.selectLang:
        return MaterialPageRoute(builder: (_) => const SelectLanguageView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:tam_tam_app/core/routing/routes_name.dart';
import 'package:tam_tam_app/views/home/bottom_navigation_bar.dart';
import 'package:tam_tam_app/views/home/home_view.dart';
import 'package:tam_tam_app/views/auth/auth_view.dart';
import 'package:tam_tam_app/views/introduction/introduction_view.dart';
import 'package:tam_tam_app/views/selection_language/selection_language_view.dart';
import 'package:tam_tam_app/views/splash/splash_view.dart';

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteNames.auth:
        return MaterialPageRoute(builder: (_) => const AuthView());
      case RouteNames.initial:
        return MaterialPageRoute(builder: (_) => const IntroductionView());
      case RouteNames.selectLang:
        return MaterialPageRoute(builder: (_) => const SelectionLanguageView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RouteNames.navBar:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

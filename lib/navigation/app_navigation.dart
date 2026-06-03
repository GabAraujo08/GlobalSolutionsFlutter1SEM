import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/solar_property.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/splash_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/intro_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/properties_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/property_detail_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/about_screen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case AppRoutes.intro:
        return MaterialPageRoute(
          builder: (_) => const IntroScreen(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => PropertiesScreen(
            onPropertyClick: (property) {
              Navigator.pushNamed(context, AppRoutes.detail, arguments: property);
            },
            onAboutClick: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
          ),
        );

      case AppRoutes.detail:
        final property = settings.arguments as SolarProperty?;
        return MaterialPageRoute(
          builder: (context) => PropertyDetailScreen(
            property: property,
            onBackClick: () => Navigator.pop(context),
          ),
        );

      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (context) => AboutScreen(
            onBackClick: () => Navigator.pop(context),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
    }
  }
}
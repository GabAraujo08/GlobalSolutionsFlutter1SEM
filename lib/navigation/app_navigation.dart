import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/space_mission.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/splash_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/intro_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/missions_screen.dart';
import 'package:globalsolutionsflutter1sem/ui/screens/mission_detail_screen.dart';
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
          builder: (context) => MissionsScreen(
            onMissionClick: (mission) {
              Navigator.pushNamed(context, AppRoutes.detail, arguments: mission);
            },
            onAboutClick: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
          ),
        );

      case AppRoutes.detail:
        final mission = settings.arguments as SpaceMission?;
        return MaterialPageRoute(
          builder: (context) => MissionDetailScreen(
            mission: mission,
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

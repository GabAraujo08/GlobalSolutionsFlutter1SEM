import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_navigation.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';

void main() {
  runApp(const GlobalSolutionsApp());
}

class GlobalSolutionsApp extends StatelessWidget {
  const GlobalSolutionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SunScore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF59E0B), // âmbar solar
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}
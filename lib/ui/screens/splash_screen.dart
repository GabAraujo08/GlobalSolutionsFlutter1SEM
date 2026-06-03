import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.intro);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1917), // dark warm
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wb_sunny_rounded,
              size: 100,
              color: Color(0xFFF59E0B),
            ),
            const SizedBox(height: 24),
            const Text(
              'SunScore',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Inteligência orbital para energia solar',
              style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.65)),
            ),
          ],
        ),
      ),
    );
  }
}
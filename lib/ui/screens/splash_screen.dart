import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';

// Tela de Splash — exibida brevemente ao abrir o app
// Requisito 1 da entrega (0,5 ponto)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navega para a intro após 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.intro);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // -----------------------------------------------------------------
            // LOGO: substitua o Icon abaixo por:
            //   Image.asset('assets/images/logo.png', width: 120, height: 120)
            // quando tiver o arquivo de logo pronto
            // -----------------------------------------------------------------
            const Icon(
              Icons.rocket_launch,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            const Text(
              'SpaceExpedition', // TODO: troque pelo nome final do app
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Explorando o universo', // TODO: ajuste o slogan
              style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}

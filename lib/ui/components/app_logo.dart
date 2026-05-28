import 'package:flutter/material.dart';

// Logo do app exibido na TopAppBar
// TODO: substitua o Text por um Image.asset('assets/images/logo.png')
//       quando tiver o logo pronto
class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.rocket_launch, size: 22),
        SizedBox(width: 8),
        Text(
          'SpaceExpedition', // TODO: troque pelo nome final do app
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

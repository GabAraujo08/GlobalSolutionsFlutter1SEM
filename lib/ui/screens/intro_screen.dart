import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';

// Dados de cada página da introdução
// TODO: ajuste os textos e ícones conforme o tema refinado
class _IntroPage {
  final String title;
  final String description;
  final IconData icon;

  const _IntroPage({
    required this.title,
    required this.description,
    required this.icon,
  });
}

// Tela de Introdução — explica o app com botões avançar/voltar
// Requisito 2 da entrega (1,0 ponto)
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  // TODO: ajuste estas páginas ao tema final da Global Solution
  final List<_IntroPage> _pages = const [
    _IntroPage(
      title: 'Bem-vindo ao SpaceExpedition',
      description:
          'Acompanhe as principais missões espaciais do presente e do futuro em um só lugar.',
      icon: Icons.rocket_launch,
    ),
    _IntroPage(
      title: 'Explore Missões',
      description:
          'Filtre por categoria — lunar, marciana, científica — e descubra detalhes de cada expedição.',
      icon: Icons.explore,
    ),
    _IntroPage(
      title: 'Fique por Dentro',
      description:
          'Saiba custos, destinos e anos de lançamento de cada missão para entender o futuro da exploração espacial.',
      icon: Icons.public,
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];
    final colors = Theme.of(context).colorScheme;
    final isLast = _currentPage == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Indicador de progresso
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (i) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _currentPage ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _currentPage ? colors.primary : colors.outlineVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 48),

              // Ícone / imagem da página
              // -----------------------------------------------------------------
              // IMAGEM: quando tiver imagens, substitua o Icon por:
              //   Image.asset('assets/images/intro_$_currentPage.png', height: 180)
              // -----------------------------------------------------------------
              Icon(page.icon, size: 100, color: colors.primary),

              const SizedBox(height: 32),

              Text(
                page.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Text(
                page.description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // Botões Voltar / Avançar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _currentPage > 0 ? _prevPage : null,
                    child: const Text('Voltar'),
                  ),
                  FilledButton(
                    onPressed: _nextPage,
                    child: Text(isLast ? 'Começar' : 'Próximo'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

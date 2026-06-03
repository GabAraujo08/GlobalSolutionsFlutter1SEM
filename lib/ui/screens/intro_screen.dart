import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/navigation/app_routes.dart';

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

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  final List<_IntroPage> _pages = const [
    _IntroPage(
      title: 'Bem-vindo ao SunScore',
      description:
          'Descubra se vale a pena instalar painéis solares no seu imóvel com precisão orbital. Cruzamos dados de satélites espaciais para gerar o relatório financeiro mais confiável do mercado.',
      icon: Icons.wb_sunny_rounded,
    ),
    _IntroPage(
      title: 'Dados do Espaço, Resultado Real',
      description:
          'Utilizamos satélites como o Sentinel-5P (ESA) e dados da NOAA para medir irradiação, índice de sujeira, temperatura e risco de apagões — variáveis que calculadoras comuns ignoram.',
      icon: Icons.satellite_alt,
    ),
    _IntroPage(
      title: 'Seu Telhado como Investimento',
      description:
          'Veja o Payback exato, a TIR do sistema e o Score de Risco Climático do seu CEP. Tome decisões de energia com a mesma segurança que investidores usam no mercado financeiro.',
      icon: Icons.trending_up,
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
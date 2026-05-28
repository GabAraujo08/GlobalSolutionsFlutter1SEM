import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/ui/components/space_top_app_bar.dart';

// Tela "Sobre" — conta como uma das 4 telas obrigatórias da navegação (requisito 3)
// TODO: preencha com os dados reais do grupo
class AboutScreen extends StatelessWidget {
  final VoidCallback onBackClick;

  const AboutScreen({super.key, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: SpaceTopAppBar(showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            Icon(Icons.rocket_launch, size: 80, color: colors.primary),
            const SizedBox(height: 16),

            Text(
              'SpaceExpedition', // TODO: nome final do app
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Text(
              'Versão 1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 24),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: colors.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre o projeto',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // TODO: descreva o problema/solução da Global Solution aqui
                    const Text(
                      'Este aplicativo foi desenvolvido como parte da Global Solution '
                      'da FIAP. O objetivo é [descreva o objetivo do seu projeto aqui].',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: colors.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Integrantes',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // TODO: adicione os nomes do grupo
                    const _MemberTile(name: 'Nome do integrante 1', rm: 'RM XXXXX'),
                    const _MemberTile(name: 'Nome do integrante 2', rm: 'RM XXXXX'),
                    const _MemberTile(name: 'Nome do integrante 3', rm: 'RM XXXXX'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onBackClick,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final String name;
  final String rm;

  const _MemberTile({required this.name, required this.rm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.person_outline, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(name)),
          Text(rm, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

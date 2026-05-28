import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/space_mission.dart';
import 'package:globalsolutionsflutter1sem/ui/components/space_top_app_bar.dart';

// Tela de detalhe de uma missão
// Conta como uma das 4 telas obrigatórias da navegação (requisito 3)
class MissionDetailScreen extends StatelessWidget {
  final SpaceMission? mission;
  final VoidCallback onBackClick;

  const MissionDetailScreen({
    super.key,
    required this.mission,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    if (mission == null) {
      return Scaffold(
        appBar: SpaceTopAppBar(showBackButton: true),
        body: const Center(child: Text('Missão não encontrada')),
      );
    }

    final colors = Theme.of(context).colorScheme;
    final m = mission!;

    return Scaffold(
      appBar: SpaceTopAppBar(showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner / imagem da missão
            // -----------------------------------------------------------------
            // IMAGEM: substitua o Container abaixo por:
            //   ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: Image.asset(
            //       m.imagePath,
            //       width: double.infinity,
            //       height: 200,
            //       fit: BoxFit.cover,
            //     ),
            //   )
            // -----------------------------------------------------------------
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  m.categories.isNotEmpty ? m.categories.first.emoji : '🚀',
                  style: const TextStyle(fontSize: 72),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Título
            Text(
              m.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Categorias
            Wrap(
              spacing: 8,
              children: m.categories
                  .map((c) => Chip(label: Text('${c.emoji} ${c.name}')))
                  .toList(),
            ),

            const SizedBox(height: 16),

            // Informações resumidas
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: colors.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Destino',
                      value: m.destination,
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Ano',
                      value: m.year.toString(),
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.attach_money,
                      label: 'Custo estimado',
                      value: 'US\$ ${m.costBillions}B',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Descrição
            Text(
              'Sobre a missão',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              m.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            // Botão voltar
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onBackClick,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar às missões'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para cada linha de info
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/solar_property.dart';
import 'package:globalsolutionsflutter1sem/ui/components/space_top_app_bar.dart';

class PropertyDetailScreen extends StatelessWidget {
  final SolarProperty? property;
  final VoidCallback onBackClick;

  const PropertyDetailScreen({
    super.key,
    required this.property,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    if (property == null) {
      return Scaffold(
        appBar: SpaceTopAppBar(showBackButton: true),
        body: const Center(child: Text('Imóvel não encontrado')),
      );
    }

    final colors = Theme.of(context).colorScheme;
    final p = property!;

    return Scaffold(
      appBar: SpaceTopAppBar(showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  p.types.isNotEmpty ? p.types.first.emoji : '☀️',
                  style: const TextStyle(fontSize: 72),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              p.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              children: p.types
                  .map((t) => Chip(label: Text('${t.emoji} ${t.name}')))
                  .toList(),
            ),

            const SizedBox(height: 16),

            // Indicadores financeiros
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
                      label: 'Endereço',
                      value: p.address,
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.roofing,
                      label: 'Área do telhado',
                      value: '${p.roofAreaM2.toStringAsFixed(0)} m²',
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.bolt,
                      label: 'Conta mensal',
                      value: 'R\$ ${p.monthlyBillBrl.toStringAsFixed(0)}',
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.wb_sunny_rounded,
                      label: 'SunScore',
                      value: '${p.sunScoreIndex.toStringAsFixed(0)} / 100',
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.schedule,
                      label: 'Payback estimado',
                      value: '${p.paybackYears.toStringAsFixed(1)} anos',
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.trending_up,
                      label: 'TIR (retorno)',
                      value: '${p.tirPercent.toStringAsFixed(1)}% a.a.',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Análise orbital',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              p.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onBackClick,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar aos imóveis'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
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
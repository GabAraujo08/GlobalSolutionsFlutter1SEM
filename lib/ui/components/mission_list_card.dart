import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/space_mission.dart';

// Card de missão exibido na lista vertical da tela principal
// Equivalente ao BoardGameCardList do projeto de referência
class MissionListCard extends StatelessWidget {
  final SpaceMission mission;
  final Function(SpaceMission)? onClick;

  const MissionListCard({
    super.key,
    required this.mission,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.outlineVariant, width: 1),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onClick != null ? () => onClick!(mission) : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // ---------------------------------------------------------
                // IMAGEM: quando tiver a imagem, substitua este Container por:
                //   ClipRRect(
                //     borderRadius: BorderRadius.circular(8),
                //     child: Image.asset(
                //       mission.imagePath,
                //       width: 60, height: 60, fit: BoxFit.cover,
                //     ),
                //   )
                // ---------------------------------------------------------
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      mission.categories.isNotEmpty
                          ? mission.categories.first.emoji
                          : '🚀',
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mission.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mission.destination,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ano: ${mission.year}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/mission_category.dart';

// Card circular de categoria usado na lista horizontal de filtros
// Equivalente ao GamePublisherCard do projeto de referência
class MissionCategoryCard extends StatelessWidget {
  final MissionCategory category;
  final Function(MissionCategory)? onClick;

  const MissionCategoryCard({
    super.key,
    required this.category,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick != null ? () => onClick!(category) : null,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Card(
          shape: const CircleBorder(),
          elevation: 4,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(category.emoji, style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 2),
                  Text(
                    category.name,
                    style: const TextStyle(fontSize: 9),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

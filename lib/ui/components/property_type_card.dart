import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/property_type.dart';

class PropertyTypeCard extends StatelessWidget {
  final PropertyType type;
  final Function(PropertyType)? onClick;

  const PropertyTypeCard({
    super.key,
    required this.type,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick != null ? () => onClick!(type) : null,
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
                  Text(type.emoji, style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 2),
                  Text(
                    type.name,
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
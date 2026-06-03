import 'package:equatable/equatable.dart';

// Tipo de imóvel / perfil de instalação
class PropertyType extends Equatable {
  final String name;
  final String emoji;

  const PropertyType({
    required this.name,
    required this.emoji,
  });

  @override
  List<Object?> get props => [name];
}
import 'package:equatable/equatable.dart';

// Representa uma categoria de missão espacial
// Equivalente ao GamePublisher do projeto de referência
class MissionCategory extends Equatable {
  final String name;
  final String emoji; // usado no lugar de imagem no card circular

  const MissionCategory({
    required this.name,
    required this.emoji,
  });

  @override
  List<Object?> get props => [name];
}

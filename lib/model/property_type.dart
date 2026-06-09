import 'package:equatable/equatable.dart';


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
import 'package:globalsolutionsflutter1sem/model/mission_category.dart';

// Representa uma missão espacial
// Equivalente ao BoardGame do projeto de referência
class SpaceMission {
  final String title;
  final String description;
  final String destination;   // ex: "Marte", "Lua", "Órbita terrestre"
  final int year;             // ano previsto/realizado da missão
  final double costBillions;  // custo em bilhões de dólares
  final List<MissionCategory> categories;

  // -----------------------------------------------------------------
  // IMAGEM: quando você tiver as imagens, adicione este campo:
  //   final String imagePath; // ex: 'assets/images/artemis.jpg'
  // e declare os assets no pubspec.yaml:
  //   flutter:
  //     assets:
  //       - assets/images/
  // -----------------------------------------------------------------

  const SpaceMission({
    required this.title,
    required this.description,
    required this.destination,
    required this.year,
    required this.costBillions,
    required this.categories,
  });
}

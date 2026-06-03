import 'package:globalsolutionsflutter1sem/model/property_type.dart';

// Representa um imóvel/propriedade cadastrada para análise solar
class SolarProperty {
  final String title;
  final String description;
  final String address;       // ex: "Av. Paulista, 1000 – São Paulo/SP"
  final double roofAreaM2;    // área do telhado em m²
  final double monthlyBillBrl; // conta de luz mensal em R$
  final double sunScoreIndex; // índice SunScore (0–100)
  final double paybackYears;  // tempo de retorno estimado em anos
  final double tirPercent;    // Taxa Interna de Retorno (%)
  final List<PropertyType> types;

  const SolarProperty({
    required this.title,
    required this.description,
    required this.address,
    required this.roofAreaM2,
    required this.monthlyBillBrl,
    required this.sunScoreIndex,
    required this.paybackYears,
    required this.tirPercent,
    required this.types,
  });
}
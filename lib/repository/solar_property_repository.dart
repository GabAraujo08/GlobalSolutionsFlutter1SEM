import 'package:globalsolutionsflutter1sem/model/solar_property.dart';
import 'package:globalsolutionsflutter1sem/repository/property_type_repository.dart';
import 'package:globalsolutionsflutter1sem/model/property_type.dart';

List<SolarProperty> getAllSolarProperties() {
  return [
    SolarProperty(
      title: 'Casa Jardins',
      description:
          'Residência unifamiliar com telhado de telha cerâmica. Índice orbital de sujeira moderado detectado pelo Sentinel-5P. Recomendação de limpeza em 30 dias para recuperar 12% de eficiência.',
      address: 'R. Oscar Freire, 420 – Jardins, SP',
      roofAreaM2: 80,
      monthlyBillBrl: 620,
      sunScoreIndex: 87,
      paybackYears: 4.2,
      tirPercent: 24.5,
      types: [residentialType, premiumType],
    ),
    SolarProperty(
      title: 'Loja Centro Campinas',
      description:
          'Estabelecimento comercial com alta irradiação solar. Análise de clima espacial (NOAA) indica baixo risco geomagnético no CEP. Expansão com baterias aumenta TIR em 6 pp.',
      address: 'Av. Francisco Glicério, 800 – Centro, Campinas/SP',
      roofAreaM2: 150,
      monthlyBillBrl: 2100,
      sunScoreIndex: 91,
      paybackYears: 3.8,
      tirPercent: 29.1,
      types: [commercialType, premiumType],
    ),
    SolarProperty(
      title: 'Galpão Logístico ABC',
      description:
          'Grande cobertura metálica com alto potencial de geração. Dados térmicos de satélite indicam ilha de calor: suportes elevados recomendados para reduzir degradação térmica em 8%.',
      address: 'Estrada dos Alvarengas, 1500 – Santo André/SP',
      roofAreaM2: 1200,
      monthlyBillBrl: 18500,
      sunScoreIndex: 78,
      paybackYears: 5.1,
      tirPercent: 19.8,
      types: [industrialType],
    ),
    SolarProperty(
      title: 'Fazenda Solar Ribeirão',
      description:
          'Propriedade rural com excelente exposição ao sol durante o ano inteiro. IA preditiva aponta risco de El Niño nos próximos 18 meses — geração ajustada com margem de 7% para baixo.',
      address: 'Rod. Anhanguera, km 310 – Ribeirão Preto/SP',
      roofAreaM2: 4000,
      monthlyBillBrl: 9800,
      sunScoreIndex: 95,
      paybackYears: 3.2,
      tirPercent: 33.4,
      types: [ruralType, premiumType],
    ),
    SolarProperty(
      title: 'Sobrado Vila Madalena',
      description:
          'Imóvel em área com alta poluição atmosférica. Sentinel-5P detectou concentração elevada de aerossóis: painéis perdem até 18% sem limpeza mensal. Alerta financeiro ativo no dashboard.',
      address: 'R. Harmonia, 200 – Vila Madalena, SP',
      roofAreaM2: 55,
      monthlyBillBrl: 380,
      sunScoreIndex: 62,
      paybackYears: 6.8,
      tirPercent: 14.2,
      types: [residentialType, highRiskType],
    ),
    SolarProperty(
      title: 'Clínica Médica Moema',
      description:
          'Uso de energia crítico e ininterrupto. Risco de instabilidade na rede (CEP com histórico de apagões + tempestade geomagnética prevista). Sistema com bateria de armazenamento é fortemente recomendado.',
      address: 'Av. Ibirapuera, 3103 – Moema, SP',
      roofAreaM2: 200,
      monthlyBillBrl: 4300,
      sunScoreIndex: 83,
      paybackYears: 4.9,
      tirPercent: 22.7,
      types: [commercialType, highRiskType],
    ),
    SolarProperty(
      title: 'Condomínio Eco Alphaville',
      description:
          'Condomínio residencial com área compartilhada para geração distribuída. Score de Risco Climático baixo. Maior potencial de upsell B2B para instaladoras parceiras do SunScore.',
      address: 'Al. dos Maracatins, 100 – Alphaville, Barueri/SP',
      roofAreaM2: 600,
      monthlyBillBrl: 11200,
      sunScoreIndex: 89,
      paybackYears: 4.0,
      tirPercent: 26.3,
      types: [residentialType, premiumType],
    ),
  ];
}

List<SolarProperty> getPropertiesByType(PropertyType type) {
  return getAllSolarProperties()
      .where((p) => p.types.contains(type))
      .toList();
}

List<SolarProperty> searchProperties(String query) {
  final lower = query.toLowerCase();
  return getAllSolarProperties()
      .where((p) =>
          p.title.toLowerCase().contains(lower) ||
          p.address.toLowerCase().contains(lower))
      .toList();
}
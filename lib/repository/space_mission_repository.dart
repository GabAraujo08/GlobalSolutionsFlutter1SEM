import 'package:globalsolutionsflutter1sem/model/space_mission.dart';
import 'package:globalsolutionsflutter1sem/repository/mission_category_repository.dart';
import 'package:globalsolutionsflutter1sem/model/mission_category.dart';

// Lista mockada de missões espaciais
// TODO: substitua/expanda conforme o tema da sua Global Solution for refinado
List<SpaceMission> getAllSpaceMissions() {
  return [
    SpaceMission(
      title: 'Artemis III',
      description: 'Primeira missão tripulada a pousar no polo sul lunar desde Apollo 17.',
      destination: 'Lua',
      year: 2026,
      costBillions: 93.0,
      categories: [lunarMission, crewedMission],
    ),
    SpaceMission(
      title: 'Mars Sample Return',
      description: 'Missão para trazer amostras coletadas pelo Perseverance de volta à Terra.',
      destination: 'Marte',
      year: 2033,
      costBillions: 10.0,
      categories: [marsMission, scienceMission],
    ),
    SpaceMission(
      title: 'Starship HLS',
      description: 'Módulo de pouso lunar da SpaceX para suportar as missões Artemis.',
      destination: 'Lua',
      year: 2026,
      costBillions: 2.9,
      categories: [lunarMission, crewedMission],
    ),
    SpaceMission(
      title: 'James Webb – Ciclo 3',
      description: 'Novo ciclo de observações do telescópio James Webb focado em exoplanetas.',
      destination: 'Ponto L2',
      year: 2025,
      costBillions: 0.2,
      categories: [deepSpaceMission, scienceMission],
    ),
    SpaceMission(
      title: 'ISS Deorbit',
      description: 'Desorbitalização controlada da Estação Espacial Internacional.',
      destination: 'Órbita Terrestre',
      year: 2030,
      costBillions: 1.0,
      categories: [orbitMission, crewedMission],
    ),
    SpaceMission(
      title: 'Europa Clipper',
      description: 'Sonda para estudar a lua Europa de Júpiter em busca de sinais de habitabilidade.',
      destination: 'Júpiter / Europa',
      year: 2030,
      costBillions: 5.0,
      categories: [deepSpaceMission, scienceMission],
    ),
    SpaceMission(
      title: 'Lunar Gateway',
      description: 'Estação espacial em órbita lunar que servirá de base para missões à Lua e Marte.',
      destination: 'Órbita Lunar',
      year: 2027,
      costBillions: 6.0,
      categories: [lunarMission, orbitMission, crewedMission],
    ),
  ];
}

// Filtra missões por categoria (equivalente ao getBoardGamesBy)
List<SpaceMission> getMissionsByCategory(MissionCategory category) {
  return getAllSpaceMissions()
      .where((mission) => mission.categories.contains(category))
      .toList();
}

// Filtra missões por texto de busca no título ou destino
List<SpaceMission> searchMissions(String query) {
  final lower = query.toLowerCase();
  return getAllSpaceMissions()
      .where((m) =>
          m.title.toLowerCase().contains(lower) ||
          m.destination.toLowerCase().contains(lower))
      .toList();
}

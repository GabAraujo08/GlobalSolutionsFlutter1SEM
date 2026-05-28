import 'package:globalsolutionsflutter1sem/model/mission_category.dart';

// Categorias de missão disponíveis para filtrar
const lunarMission    = MissionCategory(name: 'Lunar',       emoji: '🌙');
const marsMission     = MissionCategory(name: 'Marte',       emoji: '🔴');
const orbitMission    = MissionCategory(name: 'Órbita',      emoji: '🌍');
const deepSpaceMission= MissionCategory(name: 'Espaço Profundo', emoji: '🌌');
const scienceMission  = MissionCategory(name: 'Científica',  emoji: '🔭');
const crewedMission   = MissionCategory(name: 'Tripulada',   emoji: '👨‍🚀');

List<MissionCategory> getAllMissionCategories() {
  return const [
    lunarMission,
    marsMission,
    orbitMission,
    deepSpaceMission,
    scienceMission,
    crewedMission,
  ];
}

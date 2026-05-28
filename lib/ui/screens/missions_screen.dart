import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/mission_category.dart';
import 'package:globalsolutionsflutter1sem/model/space_mission.dart';
import 'package:globalsolutionsflutter1sem/repository/mission_category_repository.dart';
import 'package:globalsolutionsflutter1sem/repository/space_mission_repository.dart';
import 'package:globalsolutionsflutter1sem/ui/components/mission_category_card.dart';
import 'package:globalsolutionsflutter1sem/ui/components/mission_list_card.dart';
import 'package:globalsolutionsflutter1sem/ui/components/space_top_app_bar.dart';

// Tela principal — lista de missões com filtro por categoria
// Requisitos 3, 4, 5 e 6 da entrega
class MissionsScreen extends StatefulWidget {
  final ValueChanged<SpaceMission> onMissionClick;
  final VoidCallback onAboutClick;

  const MissionsScreen({
    super.key,
    required this.onMissionClick,
    required this.onAboutClick,
  });

  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  late List<MissionCategory> categoriesState;
  late List<SpaceMission> missionsState;

  bool _filtered = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoriesState = getAllMissionCategories();
    missionsState = getAllSpaceMissions();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterByCategory(MissionCategory category) {
    setState(() {
      _filtered = true;
      _searchController.clear();
      missionsState = getMissionsByCategory(category);
    });
  }

  void _clearFilter() {
    setState(() {
      _filtered = false;
      _searchController.clear();
      missionsState = getAllSpaceMissions();
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filtered = query.isNotEmpty;
      missionsState = query.isEmpty
          ? getAllSpaceMissions()
          : searchMissions(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpaceTopAppBar(
        actions: [
          IconButton(
            onPressed: widget.onAboutClick,
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lista horizontal de categorias (filtros)
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: categoriesState.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = categoriesState[index];
                  return MissionCategoryCard(
                    category: category,
                    onClick: _filterByCategory,
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Cabeçalho da lista + botão de limpar filtro
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _filtered ? 'Missões filtradas' : 'Todas as missões',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (_filtered)
                  IconButton(
                    onPressed: _clearFilter,
                    icon: const Icon(Icons.close),
                    tooltip: 'Limpar filtro',
                  ),
              ],
            ),

            // Campo de busca por nome/destino
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Buscar missão ou destino...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),

            const SizedBox(height: 12),

            // Lista vertical de missões
            Expanded(
              child: missionsState.isEmpty
                  ? const Center(child: Text('Nenhuma missão encontrada'))
                  : ListView.builder(
                      itemCount: missionsState.length,
                      itemBuilder: (context, index) {
                        final mission = missionsState[index];
                        return MissionListCard(
                          mission: mission,
                          onClick: widget.onMissionClick,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

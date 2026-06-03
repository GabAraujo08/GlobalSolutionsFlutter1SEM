import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/model/property_type.dart';
import 'package:globalsolutionsflutter1sem/model/solar_property.dart';
import 'package:globalsolutionsflutter1sem/repository/property_type_repository.dart';
import 'package:globalsolutionsflutter1sem/repository/solar_property_repository.dart';
import 'package:globalsolutionsflutter1sem/ui/components/property_type_card.dart';
import 'package:globalsolutionsflutter1sem/ui/components/property_list_card.dart';
import 'package:globalsolutionsflutter1sem/ui/components/space_top_app_bar.dart';

class PropertiesScreen extends StatefulWidget {
  final ValueChanged<SolarProperty> onPropertyClick;
  final VoidCallback onAboutClick;

  const PropertiesScreen({
    super.key,
    required this.onPropertyClick,
    required this.onAboutClick,
  });

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  late List<PropertyType> typesState;
  late List<SolarProperty> propertiesState;

  bool _filtered = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    typesState = getAllPropertyTypes();
    propertiesState = getAllSolarProperties();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterByType(PropertyType type) {
    setState(() {
      _filtered = true;
      _searchController.clear();
      propertiesState = getPropertiesByType(type);
    });
  }

  void _clearFilter() {
    setState(() {
      _filtered = false;
      _searchController.clear();
      propertiesState = getAllSolarProperties();
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filtered = query.isNotEmpty;
      propertiesState = query.isEmpty
          ? getAllSolarProperties()
          : searchProperties(query);
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
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: typesState.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final type = typesState[index];
                  return PropertyTypeCard(
                    type: type,
                    onClick: _filterByType,
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _filtered ? 'Imóveis filtrados' : 'Todos os imóveis',
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

            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Buscar por nome ou endereço...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: propertiesState.isEmpty
                  ? const Center(child: Text('Nenhum imóvel encontrado'))
                  : ListView.builder(
                      itemCount: propertiesState.length,
                      itemBuilder: (context, index) {
                        final property = propertiesState[index];
                        return PropertyListCard(
                          property: property,
                          onClick: widget.onPropertyClick,
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
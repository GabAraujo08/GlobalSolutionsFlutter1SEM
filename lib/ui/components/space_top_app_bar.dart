import 'package:flutter/material.dart';
import 'package:globalsolutionsflutter1sem/ui/components/app_logo.dart';

// Top app bar reutilizável do app
// Equivalente ao LudoBGTopBar do projeto de referência
class SpaceTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool showBackButton;

  const SpaceTopAppBar({
    super.key,
    this.actions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      title: const AppLogo(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

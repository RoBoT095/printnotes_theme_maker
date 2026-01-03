import 'package:flutter/material.dart';

class DrawerRailView extends StatelessWidget {
  const DrawerRailView({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButtonTheme(
      data: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary))),
      child: Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          children: [
            IconButton(
              icon: const Icon(Icons.article_outlined),
              tooltip: 'All Notes',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.history),
              tooltip: 'Recent',
              onPressed: () {},
            ),
            const Opacity(opacity: 0.2, child: Divider()),
            IconButton(
                icon: const Icon(Icons.archive_outlined),
                tooltip: 'Archive',
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.delete_outlined),
                tooltip: 'Trash',
                onPressed: () {}),
            const Opacity(opacity: 0.2, child: Divider()),
            IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: 'Settings',
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.info_outlined),
                tooltip: 'About',
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.help_outline),
                tooltip: 'Wiki',
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

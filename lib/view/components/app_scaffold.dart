import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:printnotes_theme_maker/providers/settings_provider.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.body,
    this.drawer,
  });

  final Widget body;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 0,
        title: const Text('Print(Notes)'),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(colorScheme.secondary),
                  foregroundColor:
                      WidgetStatePropertyAll<Color>(colorScheme.onSecondary)),
              onPressed: () => context.read<SettingsProvider>().setLayout(),
              child: const Row(
                children: [
                  Icon(Icons.grid_view),
                  Text(' Switch Layout'),
                ],
              )),
        ],
      ),
      drawer: drawer,
      body: body,
    );
  }
}

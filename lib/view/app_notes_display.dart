import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:printnotes_theme_maker/providers/settings_provider.dart';
import 'package:printnotes_theme_maker/constants/note_data.dart';
import 'package:printnotes_theme_maker/view/layout/app_grid_list_view.dart';
import 'package:printnotes_theme_maker/view/layout/app_tree_view.dart';

class NotesDisplay extends StatelessWidget {
  const NotesDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = noteData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('All Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: context.watch<SettingsProvider>().layout == 'tree'
          ? TreeLayoutView(items: items)
          : GridListView(items: items),
    );
  }
}

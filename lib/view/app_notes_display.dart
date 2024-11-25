import 'package:flutter/material.dart';

import 'package:printnotes_theme_maker/constants/note_data.dart';
import 'package:printnotes_theme_maker/view/layout/app_grid_list_view.dart';
import 'package:printnotes_theme_maker/view/layout/app_tree_view.dart';

class NotesDisplay extends StatefulWidget {
  const NotesDisplay({
    super.key,
    required this.currentLayout,
  });

  final String currentLayout;

  @override
  State<NotesDisplay> createState() => _NotesDisplayState();
}

class _NotesDisplayState extends State<NotesDisplay> {
  final List<Map<String, String>> _items = noteData;
  final String _currentFolderName = 'All Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(_currentFolderName),
      ),
      body: widget.currentLayout == 'tree'
          ? TreeLayoutView(items: _items)
          : GridListView(
              items: _items,
              currentLayout: widget.currentLayout,
            ),
    );
  }
}

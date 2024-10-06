import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:printnotes_theme_maker/constants/note_data.dart';
import 'package:printnotes_theme_maker/view/components/markdown/build_markdown.dart';

class NotesDisplay extends StatefulWidget {
  const NotesDisplay({
    super.key,
    required this.isLayoutGrid,
  });

  final bool isLayoutGrid;

  @override
  State<NotesDisplay> createState() => _NotesDisplayState();
}

class _NotesDisplayState extends State<NotesDisplay> {
  final List<Map<String, String>> _items = noteData;
  final String _currentFolderName = 'All Notes';
  final bool _useLatex = true;

  Widget _buildGridItem(BuildContext context, int index) {
    final item = _items[index];
    final isDirectory = item['type'] == 'folder';
    final name = item['name'].toString();

    return AbsorbPointer(
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: isDirectory
            ? ListTile(
                leading: Icon(
                  Icons.folder,
                  size: 34,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  name,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.replaceAll(".md", ''),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    MarkdownBlock(
                      selectable: false,
                      data: item['text'].toString(),
                      config:
                          theMarkdownConfigs(context, hideCodeButtons: true),
                      generator: theMarkdownGenerators(context,
                          textScale: 0.95, useLatex: _useLatex),
                    ),
                  ],
                )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(_currentFolderName),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: _displayGridCount(widget.isLayoutGrid),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childCount: _items.length,
              itemBuilder: (context, index) => _buildGridItem(context, index),
            ),
          ),
          // Adds empty space at bottom, helps when in list view
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          )
        ],
      ),
    );
  }

  int _displayGridCount(isLayoutGrid) {
    if (isLayoutGrid == false) {
      return 1;
    } else {
      return 2;
    }
  }
}

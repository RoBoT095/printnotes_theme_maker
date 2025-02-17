import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:printnotes_theme_maker/providers/settings_provider.dart';
import 'package:printnotes_theme_maker/view/components/markdown/build_markdown.dart';

class GridListView extends StatelessWidget {
  const GridListView({super.key, required this.items});

  final List<Map<String, String>> items;

  Widget _buildGridItem(BuildContext context, int index) {
    final item = items[index];
    final isDirectory = item['type'] == 'folder';
    final name = item['name'].toString();

    return Card(
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
                    config: theMarkdownConfigs(context, hideCodeButtons: true),
                    generator: theMarkdownGenerators(context,
                        textScale: 0.95, useLatex: true),
                  ),
                ],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverMasonryGrid.count(
            crossAxisCount:
                context.watch<SettingsProvider>().layout == 'list' ? 1 : 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childCount: items.length,
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
    );
  }
}

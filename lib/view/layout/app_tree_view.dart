import 'package:flutter/material.dart';
import 'package:animated_tree_view/animated_tree_view.dart';

class TreeLayoutView extends StatelessWidget {
  const TreeLayoutView({super.key, required this.items});

  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    List<Node> getTree() {
      return [
        for (var item in items)
          if (item["type"] == 'folder')
            FolderNode(data: TFolder(item['name']!))
          else if (item["type"] == 'file')
            FileNode(data: TFile(item["name"]!, type: item["type"]!))
      ];
    }

    return SafeArea(
      child: TreeView.simpleTyped<Explorable, TreeNode<Explorable>>(
        tree: TreeNode<TFolder>.root(data: TFolder("/root"))..addAll(getTree()),
        expansionBehavior: ExpansionBehavior.collapseOthersAndSnapToTop,
        expansionIndicatorBuilder: (context, node) {
          return ChevronIndicator.rightDown(
            tree: node,
            alignment: Alignment.centerLeft,
            color: Colors.grey[700],
          );
        },
        showRootNode: false,
        indentation: const Indentation(),
        builder: (context, node) => Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: ListTile(
            title: Text(node.data?.name ?? 'N/A'),
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: node.icon(context),
            ),
          ),
        ),
      ),
    );
  }
}

extension on ExplorableNode {
  Icon icon(context) {
    if (isRoot) return const Icon(Icons.data_object);

    if (this is FolderNode) {
      if (isExpanded) {
        return Icon(
          Icons.folder_open,
          color: Theme.of(context).colorScheme.secondary,
        );
      }
      return Icon(
        Icons.folder,
        color: Theme.of(context).colorScheme.secondary,
      );
    }

    if (this is FileNode) {
      final file = data as TFile;
      if (file.type == 'image') {
        return Icon(
          Icons.image_outlined,
          color: Theme.of(context).colorScheme.primary,
        );
      }
    }

    return const Icon(Icons.sticky_note_2_outlined);
  }
}

abstract class Explorable {
  final String name;

  Explorable(this.name);

  @override
  String toString() => name;
}

class TFile extends Explorable {
  final String type;

  TFile(super.name, {required this.type});
}

class TFolder extends Explorable {
  TFolder(super.name);
}

typedef ExplorableNode = TreeNode<Explorable>;

typedef FileNode = TreeNode<TFile>;

typedef FolderNode = TreeNode<TFolder>;

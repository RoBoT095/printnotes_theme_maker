import 'package:flutter/material.dart';

import 'package:printnotes_theme_maker/view/components/app_scaffold.dart';
import 'package:printnotes_theme_maker/view/app_notes_display.dart';
import 'package:printnotes_theme_maker/view/components/app_drawer.dart';
import 'package:printnotes_theme_maker/view/components/app_drawer_rail.dart';

class AppMainPage extends StatelessWidget {
  const AppMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MainScaffold(
        drawer: Drawer(
          backgroundColor: colorScheme.surface,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          child: const DrawerView(),
        ),
        body: Row(
          children: [
            const SizedBox(width: 50, child: DrawerRailView()),
            Expanded(child: NotesDisplay()),
          ],
        ));
  }
}

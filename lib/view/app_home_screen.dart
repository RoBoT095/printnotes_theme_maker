import 'package:flutter/material.dart';

import 'package:printnotes_theme_maker/view/components/app_scaffold.dart';
import 'package:printnotes_theme_maker/view/app_notes_display.dart';
import 'package:printnotes_theme_maker/view/components/app_drawer.dart';

class AppMainPage extends StatelessWidget {
  const AppMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MediaQuery.sizeOf(context).width > 1000
        ? Row(
            children: [
              Drawer(
                backgroundColor: colorScheme.surface,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                child: const DrawerView(),
              ),
              const Expanded(
                child: MainScaffold(
                  body: NotesDisplay(),
                ),
              ),
            ],
          )
        : MainScaffold(
            drawer: Drawer(
              backgroundColor: colorScheme.surface,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              child: const DrawerView(),
            ),
            body: const NotesDisplay(),
          );
  }
}

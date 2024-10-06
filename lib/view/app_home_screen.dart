import 'package:flutter/material.dart';

import 'package:printnotes_theme_maker/view/components/app_scaffold.dart';
import 'package:printnotes_theme_maker/view/app_notes_display.dart';
import 'package:printnotes_theme_maker/view/components/app_drawer.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key});

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  bool isGrid = true;
  final String appTitle = 'Print(Notes)';

  @override
  Widget build(BuildContext context) {
    bool isDisplaySmall = MediaQuery.sizeOf(context).width > 1000;
    return isDisplaySmall
        ? Row(
            children: [
              Drawer(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                child: const DrawerView(),
              ),
              Expanded(
                child: MainScaffold(
                  title: appTitle,
                  isGrid: () {
                    setState(() => isGrid = !isGrid);
                  },
                  body: NotesDisplay(
                    isLayoutGrid: isGrid,
                  ),
                ),
              ),
            ],
          )
        : MainScaffold(
            title: appTitle,
            drawer: Drawer(
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              child: const DrawerView(),
            ),
            isGrid: () {
              setState(() => isGrid = !isGrid);
            },
            body: NotesDisplay(
              isLayoutGrid: isGrid,
            ),
          );
  }
}

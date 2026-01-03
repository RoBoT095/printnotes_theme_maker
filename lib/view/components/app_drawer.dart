import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListTileTheme(
            iconColor: Theme.of(context).colorScheme.secondary,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // DrawerHeader without bottom border
                Container(
                  height: MediaQuery.paddingOf(context).top + 160.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0)
                        .add(EdgeInsets.only(
                            top: MediaQuery.paddingOf(context).top)),
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.fastOutSlowIn,
                    child: Image.asset(
                      'app_icon_no-bg.png',
                      height: 48,
                    ),
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.article_outlined),
                    title: const Text('All Notes'),
                    onTap: () {}),
                ListTile(
                    leading: const Icon(Icons.history),
                    title: Text('Recent'),
                    onTap: () {}),
                ExpansionTile(
                  leading: Icon(Icons.tag),
                  title: Text('Tags'),
                  collapsedIconColor: Theme.of(context).colorScheme.secondary,
                  children: [ListTile(title: Text('#TestTag'))],
                ),
                const Opacity(opacity: 0.2, child: Divider()),
                ListTile(
                    leading: const Icon(Icons.archive_outlined),
                    title: const Text('Archive'),
                    onTap: () {}),
                ListTile(
                    leading: const Icon(Icons.delete_outlined),
                    title: const Text('Trash'),
                    onTap: () {}),
                const Opacity(opacity: 0.2, child: Divider()),
                ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Settings'),
                    onTap: () {}),
                ListTile(
                    leading: const Icon(Icons.info_outlined),
                    title: const Text('About'),
                    onTap: () {}),
                ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('Wiki'),
                    trailing: const Icon(Icons.launch_rounded),
                    onTap: () {}),
              ],
            ),
          ),
        ),
        const ListTile(
          title: Opacity(
            opacity: 0.5,
            child: Text(
              'Version: 0.10.6',
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

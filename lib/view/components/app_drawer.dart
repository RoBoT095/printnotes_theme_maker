import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).colorScheme.brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader without bottom border
              Container(
                height: MediaQuery.paddingOf(context).top + 160.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0).add(
                      EdgeInsets.only(top: MediaQuery.paddingOf(context).top)),
                  duration: const Duration(milliseconds: 250),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/app_icon_no-bg.png",
                          height: 64,
                        ),
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                iconColor: Theme.of(context).colorScheme.secondary,
                leading: const Icon(Icons.article_outlined),
                title: const Text('All Notes'),
                onTap: () {},
              ),
              const Opacity(opacity: 0.2, child: Divider()),
              ListTile(
                iconColor: Theme.of(context).colorScheme.secondary,
                leading: const Icon(Icons.archive_outlined),
                title: const Text('Archive'),
                onTap: () {},
              ),
              const Opacity(opacity: 0.2, child: Divider()),
              ListTile(
                iconColor: Theme.of(context).colorScheme.secondary,
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                iconColor: Theme.of(context).colorScheme.secondary,
                leading: const Icon(Icons.sync),
                title: const Text('Sync'),
                onTap: () {},
              ),
              ListTile(
                iconColor: Theme.of(context).colorScheme.secondary,
                leading: const Icon(Icons.info_outlined),
                title: const Text('About'),
                onTap: () {},
              ),
            ],
          ),
        ),
        const ListTile(
          title: Opacity(
            opacity: 0.5,
            child: Text(
              'Version: 0.9.3',
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

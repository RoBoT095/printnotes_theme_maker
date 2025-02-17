import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:printnotes_theme_maker/providers/settings_provider.dart';
import 'package:printnotes_theme_maker/providers/theme_provider.dart';
import 'package:printnotes_theme_maker/view/app_home_screen.dart';
import 'package:printnotes_theme_maker/view/color_picker_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: themeProvider.colorScheme),
        title: 'Print(Notes) Designer',
        home: const AppDisplay(),
      ),
    );
  }
}

class AppDisplay extends StatelessWidget {
  const AppDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDisplaySmall = MediaQuery.sizeOf(context).width > 800;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          iconColor: colorScheme.primary,
          leading: const Icon(Icons.format_color_fill, size: 32),
          title: const Text(
            'Theme Designer',
            style: TextStyle(fontSize: 24),
          ),
        ),
        actions: [
          DropdownButton(
              value: context.watch<ThemeProvider>().schemeName,
              borderRadius: BorderRadius.circular(10),
              items: const [
                DropdownMenuItem(
                  value: 'default_light',
                  child: Text('Default Blue - Light'),
                ),
                DropdownMenuItem(
                  value: 'default_dark',
                  child: Text('Default Blue - Dark'),
                ),
                DropdownMenuItem(
                  value: 'nordic_light',
                  child: Text('Nordic - Light'),
                ),
                DropdownMenuItem(
                  value: 'nordic_dark',
                  child: Text('Nordic - Dark'),
                ),
                DropdownMenuItem(
                  value: 'green_apple_light',
                  child: Text('Green Apple - Light'),
                ),
                DropdownMenuItem(
                  value: 'green_apple_dark',
                  child: Text('Green Apple - Dark'),
                ),
                DropdownMenuItem(
                  value: 'lavender_light',
                  child: Text('Lavender - Light'),
                ),
                DropdownMenuItem(
                  value: 'lavender_dark',
                  child: Text('Lavender - Dark'),
                ),
                DropdownMenuItem(
                  value: 'strawberry_light',
                  child: Text('Strawberry - Light'),
                ),
                DropdownMenuItem(
                  value: 'strawberry_dark',
                  child: Text('Strawberry - Dark'),
                ),
              ],
              onChanged: (value) =>
                  context.read<ThemeProvider>().setStarterTheme(value!)),
        ],
      ),
      body: isDisplaySmall
          ? const Row(
              children: [
                Expanded(child: ColorPickerView()),
                Expanded(flex: 2, child: AppMainPage())
              ],
            )
          : const AppMainPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isDisplaySmall
          ? null
          : FloatingActionButton.large(
              backgroundColor: colorScheme.secondary,
              foregroundColor: colorScheme.onSecondary,
              child: const Icon(Icons.palette, size: 60),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SafeArea(child: ColorPickerView());
                },
              ),
            ),
    );
  }
}

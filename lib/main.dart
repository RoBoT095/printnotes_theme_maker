import 'package:flutter/material.dart';
import 'package:printnotes_theme_maker/view/color_picker_page.dart';
import 'package:provider/provider.dart';

import 'package:printnotes_theme_maker/providers/theme_provider.dart';
import 'package:printnotes_theme_maker/view/app_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
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
        theme: themeDataFromColorScheme(themeProvider.colorScheme),
        title: 'Print(Notes) Theme Designer',
        home: AppDisplay(theme: themeProvider),
      ),
    );
  }
}

class AppDisplay extends StatelessWidget {
  const AppDisplay({super.key, required this.theme});

  final ThemeProvider theme;

  colorPickerView(theme) => ColorPickerView(
        onColorChanged: (color, property) => theme.updateColor(property, color),
        onBrightnessChanged: (brightness) => theme.updateBrightness(brightness),
        colorScheme: theme.colorScheme,
      );

  @override
  Widget build(BuildContext context) {
    bool isSmallDisplay = MediaQuery.sizeOf(context).width > 800;
    return isSmallDisplay
        ? Row(
            children: [
              Expanded(
                  child: Scaffold(
                appBar: AppBar(
                  title: const Text('Theme Designer'),
                ),
                body: colorPickerView(theme),
              )),
              const Expanded(flex: 2, child: AppMainPage()),
            ],
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Theme Designer'),
            ),
            body: const AppMainPage(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton.large(
              child: const Icon(
                Icons.palette,
                size: 60,
              ),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SafeArea(child: colorPickerView(theme));
                },
              ),
            ),
          );
  }
}

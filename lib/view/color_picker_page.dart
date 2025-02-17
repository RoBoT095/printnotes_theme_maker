import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:printnotes_theme_maker/providers/theme_provider.dart';
import 'package:printnotes_theme_maker/view/components/color_picker.dart';

class ColorPickerView extends StatefulWidget {
  const ColorPickerView({super.key});

  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  String text = 'Nothing here yet...';

  void _onColorChanged(Color color, String property) {
    context.read<ThemeProvider>().updateColor(property, color);
  }

  void _onBrightnessChanged(bool value) {
    Brightness brightness = value ? Brightness.dark : Brightness.light;
    context.read<ThemeProvider>().updateBrightness(brightness);
  }

  void _exportColorScheme() {
    ColorScheme c = context.read<ThemeProvider>().colorScheme;
    String newColorScheme =
        '{"brightness": ${c.brightness.index}, "primary": ${c.primary.value}, "onPrimary": ${c.onPrimary.value}, "secondary": ${c.secondary.value}, "onSecondary": ${c.onSecondary.value}, "surface": ${c.surface.value}, "onSurface": ${c.onSurface.value}, "surfaceContainer": ${c.surfaceContainer.value}}';
    setState(() => text = newColorScheme);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.watch<ThemeProvider>().colorScheme;
    return ListView(
      children: [
        ListTile(
            title: Text(
              'Primary',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
              color: colorScheme.primary,
              onColorChange: (Color color) => _onColorChanged(color, 'primary'),
            )),
        ListTile(
            title: Text(
              'onPrimary',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
                color: colorScheme.onPrimary,
                onColorChange: (Color color) =>
                    _onColorChanged(color, 'onPrimary'))),
        ListTile(
            title: Text(
              'Secondary',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
                color: colorScheme.secondary,
                onColorChange: (Color color) =>
                    _onColorChanged(color, 'secondary'))),
        ListTile(
            title: Text(
              'onSecondary',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
                color: colorScheme.onSecondary,
                onColorChange: (Color color) =>
                    _onColorChanged(color, 'onSecondary'))),
        ListTile(
            title: Text(
              'Background',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
                color: colorScheme.surface,
                onColorChange: (Color color) =>
                    _onColorChanged(color, 'surface'))),
        ListTile(
            title: Text(
              'onBackground',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
                color: colorScheme.onSurface,
                onColorChange: (Color color) =>
                    _onColorChanged(color, 'onSurface'))),
        ListTile(
            title: Text(
              'Note Background',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: ColorTile(
                color: colorScheme.surfaceContainer,
                onColorChange: (Color color) =>
                    _onColorChanged(color, 'surfaceContainer'))),
        ListTile(
            title: Text(
              'Is this a dark theme?',
              style: TextStyle(color: colorScheme.onSurface),
            ),
            trailing: Switch(
              activeColor: colorScheme.primary.withOpacity(0.8),
              value: context.watch<ThemeProvider>().colorScheme.brightness ==
                  Brightness.dark,
              onChanged: (value) => _onBrightnessChanged(value),
            )),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      WidgetStatePropertyAll<Color>(colorScheme.onSecondary),
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(colorScheme.secondary)),
              onPressed: _exportColorScheme,
              child: const Text('Export Theme'),
            ),
          ),
        ),
        const Center(
            child: Text(
          'Once you are done, export and paste into app, or share with others!',
          textAlign: TextAlign.center,
        )),
        Card(
          color: colorScheme.surfaceContainer,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  SelectableText(text),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          child: Icon(
                            Icons.copy_rounded,
                            color: colorScheme.onSurface,
                          ),
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: text));
                          },
                        ),
                      )),
                ],
              )),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
              child: Text(
            'To use theme in Print(Notes) app, go to Settings, scroll to "Styles" and change Color Scheme to "Custom", then select Custom Color Scheme button, and paste string in "Theme Management"',
            textAlign: TextAlign.center,
          )),
        ),
      ],
    );
  }
}

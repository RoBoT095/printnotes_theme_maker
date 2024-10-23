import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printnotes_theme_maker/view/components/color_picker.dart';

class ColorPickerView extends StatefulWidget {
  const ColorPickerView({
    super.key,
    required this.onColorChanged,
    required this.onBrightnessChanged,
    required this.colorScheme,
  });

  final Function(Color color, String property) onColorChanged;
  final Function(Brightness brightness) onBrightnessChanged;
  final ColorScheme colorScheme;

  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  String text = 'Nothing here yet...';
  bool isDark = false;

  void _onColorChanged(Color color, String property) {
    setState(() => widget.onColorChanged(color, property));
  }

  void _onBrightnessChanged(bool value) {
    Brightness brightness = value ? Brightness.dark : Brightness.light;
    setState(() {
      isDark = value;
      widget.onBrightnessChanged(brightness);
    });
  }

  void _exportColorScheme() {
    ColorScheme c = widget.colorScheme;
    String newColorScheme =
        '{"brightness": ${c.brightness.index}, "primary": ${c.primary.value}, "onPrimary": ${c.onPrimary.value}, "secondary": ${c.secondary.value}, "onSecondary": ${c.onSecondary.value}, "surface": ${c.surface.value}, "onSurface": ${c.onSurface.value}, "surfaceContainer": ${c.surfaceContainer.value}}';
    setState(() => text = newColorScheme);
  }

  @override
  Widget build(BuildContext context) {
    var themeColors = Theme.of(context).colorScheme;
    return ListView(
      children: [
        ListTile(
            title: Text(
              'Primary',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
              initialColor: themeColors.primary,
              onColorChange: (Color color) =>
                  setState(() => _onColorChanged(color, 'primary')),
            )),
        ListTile(
            title: Text(
              'onPrimary',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
                initialColor: themeColors.onPrimary,
                onColorChange: (Color color) =>
                    setState(() => _onColorChanged(color, 'onPrimary')))),
        ListTile(
            title: Text(
              'Secondary',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
                initialColor: themeColors.secondary,
                onColorChange: (Color color) =>
                    setState(() => _onColorChanged(color, 'secondary')))),
        ListTile(
            title: Text(
              'onSecondary',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
                initialColor: themeColors.onSecondary,
                onColorChange: (Color color) =>
                    setState(() => _onColorChanged(color, 'onSecondary')))),
        ListTile(
            title: Text(
              'Background',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
                initialColor: themeColors.surface,
                onColorChange: (Color color) =>
                    setState(() => _onColorChanged(color, 'surface')))),
        ListTile(
            title: Text(
              'onBackground',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
                initialColor: themeColors.onSurface,
                onColorChange: (Color color) =>
                    setState(() => _onColorChanged(color, 'onSurface')))),
        ListTile(
            title: Text(
              'Note Background',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: ColorTile(
                initialColor: themeColors.surfaceContainer,
                onColorChange: (Color color) => setState(
                    () => _onColorChanged(color, 'surfaceContainer')))),
        ListTile(
            title: Text(
              'Is this a dark theme?',
              style: TextStyle(color: themeColors.onSurface),
            ),
            trailing: Switch(
              activeColor: themeColors.primary.withOpacity(0.8),
              value: isDark,
              onChanged: (value) => _onBrightnessChanged(value),
            )),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      WidgetStatePropertyAll<Color>(themeColors.onSecondary),
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(themeColors.secondary)),
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
          color: themeColors.surfaceContainer,
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
                            color: themeColors.onSurface,
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

import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class ColorTile extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorChange;

  const ColorTile({
    super.key,
    required this.initialColor,
    required this.onColorChange,
  });

  @override
  State<ColorTile> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  Color _color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
  }

  Future<bool> showColorPickerDialog() async {
    return ColorPicker(
      color: _color,
      onColorChanged: (Color color) => setState(() => _color = color),
      width: 40,
      height: 40,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return ColorIndicator(
      width: 40,
      height: 40,
      color: _color,
      elevation: 8,
      // hasBorder: true,
      onSelectFocus: false,
      onSelect: () async {
        final Color colorBeforeDialog = _color;
        if (!(await showColorPickerDialog())) {
          setState(() {
            _color = colorBeforeDialog;
          });
        } else {
          widget.onColorChange(_color);
        }
      },
    );
  }
}

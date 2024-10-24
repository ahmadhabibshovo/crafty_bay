import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.onColorSelected,
  });
  final List<Color> colors;

  final Function(Color) onColorSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _selectedColor = widget.colors.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: context.textStyles.titleLarge,
        ),
        Wrap(
          spacing: 8,
          children: widget.colors
              .map((color) => GestureDetector(
                    onTap: () {
                      _selectedColor = color;
                      widget.onColorSelected(color);
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: color,
                      child: _selectedColor == color
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 28,
                            )
                          : null,
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}

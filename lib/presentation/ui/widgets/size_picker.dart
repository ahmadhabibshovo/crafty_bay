import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });
  final List<String> sizes;

  final Function(String) onSizeSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize = widget.sizes.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: context.textStyles.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8,
            children: widget.sizes
                .map((size) => GestureDetector(
                      onTap: () {
                        _selectedSize = size;
                        widget.onSizeSelected(size);
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: _selectedSize == size
                                ? AppColors.themeColor
                                : null),
                        child: Center(
                          child: Text(
                            size,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _selectedSize == size
                                    ? Colors.white
                                    : null),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

extension SizedBoxExtention on num {
  SizedBox get sizeBoxFromWidth => SizedBox(
        width: toDouble(),
      );
  SizedBox get sizeBoxFromHeight => SizedBox(
        height: toDouble(),
      );
}

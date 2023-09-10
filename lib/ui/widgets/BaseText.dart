import "package:flutter/material.dart";
import "package:moviedbapp/core/theme/ColorIndex.dart";

class BaseText extends StatelessWidget {
  const BaseText({
    Key? key,
    this.textColor = ColorIndex.primaryText,
    required this.text,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
    this.paddings = const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
    this.isOverflow,
  }) : super(key: key);

  final Color? textColor;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final EdgeInsets? paddings;
  final bool? isOverflow;

  @override
  Widget build(BuildContext context) {
    String showedText = "";

    if (isOverflow != null && isOverflow! && text.length > 18) {
      showedText = '${text.substring(0, 18)}...';
    } else {
      showedText = text;
    }

    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: paddings,
          child: Text(
            showedText,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ));
  }
}

import "package:flutter/material.dart";

class BaseText extends StatelessWidget {
  const BaseText({
    Key? key,
    this.textColor = Colors.white,
    required this.text,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
    this.paddings = const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  }) : super(key: key);

  final Color? textColor;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final EdgeInsets? paddings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: paddings,
        child: Text(
          text ?? "",
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      )
    );
  }
}

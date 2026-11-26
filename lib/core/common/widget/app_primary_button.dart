import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.textColor = Colors.white,
    this.loadingWidth = 60,
    this.icon,
    this.isLoading = false,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
    this.disabledBackgroundColor = Colors.black,
    this.verticalPadding = 13,
    this.horizontalPadding = 24,
    this.borderRadius = 16,
    this.fontSize = 16,
    this.iconSize = 20,
    this.borderSide,
  });
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double borderRadius;
  final double fontSize;
  final double iconSize;
  final BorderSide? borderSide;
  final double? width;
  final double loadingWidth;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isLoading ? loadingWidth : width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          foregroundColor: foregroundColor,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSide ?? BorderSide(color: Colors.black),
          ),
          elevation: 0,
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[icon!, SizedBox(width: 8)],
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

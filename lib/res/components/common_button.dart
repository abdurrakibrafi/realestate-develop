import 'package:flutter/material.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

Widget commonButton(String title,
    {Color color = AppColor.primaryColor,
    Color textColor = Colors.white,
    double textSize = 18,
    double width = double.infinity,
    double height = 50,
    VoidCallback? onTap,
    bool isLoading = false}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45,
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: color,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: isLoading
              ? const CircularProgressIndicator()
              : commonText(title,
                  size: textSize, color: textColor, isBold: true),
        ),
      ),
    ),
  );
}

Widget commonBorderButton(String title,
    {double width = double.infinity,
    VoidCallback? onTap,
    Color borderColor = AppColor.primaryColor,
    double height = 50.0,
    double fontSize = 18.0,
    double borderWidth = 1.0,
    bool isLoading = false}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45,
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : commonText(title,
                size: 18, color: AppColor.primaryColor, isBold: true),
      ),
    ),
  );
}

Widget commonIconButton(String title,
    {Color color = Colors.black87,
    Color textColor = Colors.white,
    double textSize = 16,
    double width = double.infinity,
    double height = 40,
    required Widget icon,
    VoidCallback? onTap,
    bool isLoading = false}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: color,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: isLoading
              ? const CircularProgressIndicator()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    SizedBox(
                      width: 10,
                    ),
                    commonText(title,
                        size: textSize, color: textColor, isBold: true),
                  ],
                ),
        ),
      ),
    ),
  );
}

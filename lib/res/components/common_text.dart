import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonText(String text,
    {double size = 12.0,
    Color color = Colors.black,
    bool isBold = false,
      int? maxLines,
    TextAlign textAlign = TextAlign.left}) {
  Locale? locale = Get.locale;
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines ?? 10,
    textAlign: (locale?.languageCode == 'ar' && locale?.countryCode == 'SA')
        ? TextAlign.right
        : textAlign,
    style: (locale?.languageCode == 'ar' && locale?.countryCode == 'SA')
        ? GoogleFonts.cairo(
            fontSize: size,
            color: color,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          )
        : GoogleFonts.roboto(
            fontSize: size,
            color: color,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
  );
}

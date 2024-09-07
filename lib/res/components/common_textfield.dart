import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

Widget commonTextfield(
  TextEditingController controller, {
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  String? assetIconPath,
  VoidCallback? onTap,
  bool isEnable = true,
  Color borderColor = const Color(0xffD7D7D7),
  int maxLine = 1,
  Function(String)? onChanged,
}) {
  return Container(
    height: 46,
    decoration: BoxDecoration(
      color: const Color(0xffFCFCFC),
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(
        color: borderColor,
        width: 1.0,
      ),
    ),
    child: TextField(
      onTap: onTap,
      enabled: isEnable,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLine,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12.0, bottom: 5),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: AppColor.darkGreyColor,
        ),
        border: InputBorder.none,
        prefixIcon: assetIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(assetIconPath),
                  size: 24.0,
                ),
              )
            : null,
      ),
    ),
  );
}
Widget commonTextfieldWithTitle(String title, TextEditingController controller,
    {FocusNode? focusNode,
      String hintText = "",
      TextInputType? keyboardType,
      String? assetIconPath,
      Color borderColor = const Color(0xffD7D7D7),
      int maxLine = 1,
      bool? suffix,
      Widget? suffixWidget,
      double borderradious = 30.0,
      bool obscureText = false,
      String? Function(String?)? onValidate,
      Function(String?)? onFieldSubmit}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commonText(title, size: 14, isBold: true),
      const SizedBox(
        height: 5,
      ),
      Container(
        height: 48,
        width: 320,
        decoration: BoxDecoration(
          color: const Color(0xffFCFCFC),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: onValidate,
          onFieldSubmitted: onFieldSubmit,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLines: maxLine,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: suffixWidget != null
                ? const EdgeInsets.only(left: 12, top: 6, right: 50)
                : const EdgeInsets.only(left: 12, bottom: 5),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColor.darkGreyColor,
            ),
            border: InputBorder.none,
            suffixIcon: suffixWidget != null ? suffixWidget : null,
            prefixIcon: assetIconPath != null
                ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ImageIcon(
                AssetImage(assetIconPath),
                size: 21.0,
              ),
            )
                : null,
          ),
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import '../../viewModel/controllers/dropdown_controller.dart';

class CustomDropdown extends StatelessWidget {
  final DropdownController controller;
  final String hintText;

  const CustomDropdown(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xffFCFCFC),
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
              color:  const Color(0xffD7D7D7),
            width: 1.0,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selected.value.isEmpty
                ? null
                : controller.selected.value,
            hint: commonText(hintText.tr,
                size: 12, color: AppColor.darkGreyColor),
            items: controller.options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: commonText(value.tr),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                controller.selected(newValue);
              }
            },
            isExpanded: true,
            underline: Container(
              height: 1,
              color: Colors.grey,
            ),
            icon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      );
    });
  }
}

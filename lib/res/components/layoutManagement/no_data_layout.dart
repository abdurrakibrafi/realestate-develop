import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_text.dart';

Widget emptyListView() {
  return SizedBox(
      child: Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(
        FontAwesomeIcons.folderOpen,
        size: 70,
        color: AppColor.primaryColor,
      ),
      const SizedBox(
        height: 10,
      ),
      commonText("No data found".tr, size: 14)
    ]),
  ));
}
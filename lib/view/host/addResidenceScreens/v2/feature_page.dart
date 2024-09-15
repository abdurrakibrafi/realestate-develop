import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/requerments.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class FeaturePage extends StatefulWidget {
  final bool isEdit;
  const FeaturePage({super.key, required this.isEdit});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  // final TextEditingController aboutPropertyController = TextEditingController();

  // Set<String> selectedFeatures = <String>{};

  final controller = Get.find<AddResidenceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Features".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              commonText("2", color: AppColor.primaryColor),
              commonText("/4"),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("About Residence".tr, size: 14, isBold: true),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFCFCFC),
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: Color(0xffD7D7D7),
                          width: 1.0,
                        ),
                      ),
                      child: TextField(
                        controller: controller.aboutPropertyController,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColor.blackColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12.0),
                          hintText: "Tell us about property".tr,
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColor.darkGreyColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  commonText("Select features".tr, size: 16, isBold: true),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() {
                return Center(
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: controller.features.map((feature) {
                      bool isSelected =
                          controller.selectedFeatures.contains(feature["label"]);
                      return GestureDetector(
                        onTap: () {
                          if (isSelected) {
                            controller.selectedFeatures.remove(feature["label"]);
                          } else {
                            log(controller.selectedFeatures.toString());
                            controller.selectedFeatures.add(feature["label"]!);
                          }
                        },
                        child:
                            FeatureItem(feature: feature, isSelected: isSelected),
                      );
                    }).toList(),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 320,
                  child: commonButton(
                    "Next".tr,
                    onTap: () {
                      if (controller.validateFeaturePage()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RequermentsPage(isEdit: widget.isEdit)),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final Map<String, String> feature;
  final bool isSelected;

  const FeatureItem(
      {super.key, required this.feature, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: isSelected ? AppColor.primaryColor : Colors.grey,
              width: isSelected ? 1 : 0.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/resident_icons/${feature["icon"]}.png',
                  width: 25,
                  height: 25,
                  color: isSelected ? AppColor.primaryColor : Colors.black,
                ),
                Row(
                  children: [
                    Expanded(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: commonText(feature["label"]!,
                                color: isSelected
                                    ? AppColor.primaryColor
                                    : Colors.black,
                                size: 10.0,
                                textAlign: TextAlign.center))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

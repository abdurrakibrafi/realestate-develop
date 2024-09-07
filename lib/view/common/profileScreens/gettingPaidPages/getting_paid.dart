// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/viewModel/controllers/profileControllers/getting_paid_controller.dart';

class GettingPaid extends StatelessWidget {
  const GettingPaid({super.key});

  @override
  Widget build(BuildContext context) {
    GettingPaidController controller = Get.put(GettingPaidController());
    Get.put(
      DropdownController([
        'Kuwait',
        'USA',
      ]),
      tag: 'nationality',
    );
    return Scaffold(
        appBar: AppBar(
          title: commonText("Getting Paid".tr, size: 15),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
        ),
        backgroundColor: AppColor.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    commonText("Country".tr, size: 14),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomDropdown(
                    controller: Get.find(tag: 'nationality'),
                    hintText: "Select your country".tr),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                    "Beneficiary’s Full Name".tr, controller.nameController,
                    hintText: "Enter your full name in English".tr,
                    assetIconPath: "assets/icons/dashicons_nametag.png",
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                    "Bank Name".tr, controller.bankNameController,
                    hintText: "Enter your bank name".tr,
                    assetIconPath: "assets/icons/guidance_bank.png",
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                    "Swift Code (international accounts only)".tr,
                    controller.swiftCodeController,
                    hintText: "Enter your bank’s swift code".tr,
                    assetIconPath: "assets/icons/tabler_transfer.png",
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle("IBAN / Account Number".tr,
                    controller.accountNumberController,
                    hintText: "Enter your bank account / IBAN No.".tr,
                    assetIconPath: "assets/icons/guidance_bank.png",
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                    "Beneficiary’s Address".tr, controller.addressController,
                    hintText: "Enter your address".tr,
                    assetIconPath: "assets/icons/mdi_address-marker.png",
                    maxLine: 2,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return commonButton("Submit".tr,
                      isLoading: controller.loading.value, onTap: () {
                    controller.loginApi();
                  });
                }),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primaryColor,
                      ),
                      child: const Icon(Icons.close,
                          color: Colors.white, size: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child:
                      commonText('Disclaimer!'.tr.tr, size: 16.0, isBold: true),
                ),
                const SizedBox(height: 20),
                Center(
                  child: commonText(
                    'You are responsible for the accuracy of the bank details you have provided. We are not liable for any errors that may cause delays or cancellations of transferred funds'
                        .tr,
                    size: 14.0,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: AppColor.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle No action
                            Navigator.of(context).pop();
                          },
                          child: commonText(
                            'Cancel'.tr,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle Yes action
                          },
                          child: commonText(
                            'Accept'.tr,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

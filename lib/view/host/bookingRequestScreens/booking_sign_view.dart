import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/viewModel/controllers/profileControllers/profile_controller.dart';
import 'package:signature/signature.dart';
import '../../../controller/booking/booking_sign_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';

import '../../../service/local_storage.dart';

class BookingSignView extends StatefulWidget {
  final String bookingId;
  final bool isTenant;

  const BookingSignView({
    super.key,
    required this.bookingId,
    required this.isTenant,
  });

  @override
  State<BookingSignView> createState() => _BookingSignViewState();
}

class _BookingSignViewState extends State<BookingSignView> {
  final BookingSignController controller = Get.put(BookingSignController());
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController civilTextController = TextEditingController();
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  var isChecked = false.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: Image.asset(
          "assets/images/Logo.png", // Replace with your logo path
          height: 50,
        ),
        centerTitle: true,
        actions: [
          Text("2/2", style: TextStyle(color: Colors.black)),
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: commonText("Booking Confirmation".tr,
                    size: 18, isBold: true, color: Colors.black),
              ),
              SizedBox(height: 5),
              commonText(
                  "To confirm this booking, please enter your civil ID and your electronic signature. To review the contract, click the 'View' button below."
                      .tr,
                  size: 11,
                  isBold: false,
                  color: Colors.black,
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              profileController.profileData.value?.role.toString() == "user"?   Column(
              children: [
                Divider(color: Colors.grey.withOpacity(0.2)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText("Required Documents".tr,
                        size: 13, isBold: true, color: Colors.black),
                    GestureDetector(
                      onTap: () {
                        controller.pickImages();
                      },
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Upload".tr,
                            style: TextStyle(
                                color: AppColor.primaryColor, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 10),
                Obx(() => controller.pickedImages.isNotEmpty
                    ? GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: controller.pickedImages.length,
                  itemBuilder: (context, index) {
                    return Image.file(
                      controller.pickedImages[index],
                      fit: BoxFit.cover,
                    );
                  },
                )
                    : SizedBox()),
                Obx(
                      () => controller.pickedImages.isNotEmpty
                      ? Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () => controller.pickedImages.clear(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: AppColor.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Clear".tr,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      : SizedBox(),
                ),
              ],
            ): SizedBox(),

              SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.2)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText("View Contract".tr,
                      size: 13, isBold: true, color: Colors.black),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "View".tr,
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.2)),
              SizedBox(height: 10),
              commonText("Civil ID Number".tr,
                  size: 13, isBold: true, color: Colors.black),
              SizedBox(height: 10),
              Container(
                  height: 45,
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.lightGreyColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      controller: civilTextController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your civil ID number".tr,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Column(
                    children: [
                      Center(
                        child: commonText(
                            "Please enter your digital signature.".tr,
                            size: 13,
                            isBold: false,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Signature(
                        controller: _signatureController,
                        height: 300,
                        backgroundColor: Colors.grey[200]!,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            _signatureController.clear();
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Container(
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.restart_alt,
                                      color: AppColor.primaryColor),
                                  Text(
                                    "Try Again".tr,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "By signing here you are entering into a legally binding agreement.",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: isChecked.value,
                      onChanged: (bool? value) {
                        toggleCheckbox();
                      },
                    ),
                  ),
                  Text(
                    'I have read and accepted the Terms and Conditions'.tr,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () => Center(
                  child: commonButton(
                    "Confirm".tr,
                    onTap: () {
                      if ( profileController.profileData.value?.role.toString() == "user") {
                        if (controller.pickedImages.isNotEmpty) {
                          if (isChecked.value) {
                            controller.submitTenantSignature(widget.bookingId,
                                _signatureController, civilTextController.text);
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please accept the terms and conditions.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please add required documents",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      } else {

                          if (isChecked.value) {
                            controller.submitSignature(widget.bookingId,
                                _signatureController, civilTextController.text);
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please accept the terms and conditions.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }

                      }
                    },
                    isLoading: controller.isLoading.value,
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

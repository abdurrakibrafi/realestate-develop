import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import '../../../controller/booking/booking_sign_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';

import '../../../service/local_storage.dart';

class BookingSignView extends StatefulWidget {
  final String bookingId;
  final bool isTenant;

  const BookingSignView({super.key, required this.bookingId, required this.isTenant,});

  @override
  State<BookingSignView> createState() => _BookingSignViewState();
}

class _BookingSignViewState extends State<BookingSignView> {
  final BookingSignController controller = Get.put(BookingSignController());
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
                child: commonText("Booking Confirmation",
                    size: 18, isBold: true, color: Colors.black),
              ),
              SizedBox(height: 5),
              commonText(
                  "To confirm this booking, please enter your civil ID and your electronic signature. To review the contract, click the 'View' button below.",
                  size: 11,
                  isBold: false,
                  color: Colors.black,
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.2)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText("View Contract",
                      size: 13, isBold: true, color: Colors.black),
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "View",
                        style: TextStyle(color: AppColor.primaryColor, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey.withOpacity(0.2)),
              SizedBox(height: 10),
              commonText("Civil ID Number",
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
                        hintText: "Enter your civil ID number",
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
                            "Please enter your digital signature.",
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
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Container(
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.restart_alt,
                                      color: AppColor.primaryColor),
                                  Text(
                                    "Try Again",
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
                  const Text(
                    'I have read and accepted the Terms and Conditions',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () => commonButton(
                  "Confirm",
                  onTap: () {
                  if(LocalStorage.getData(key: "role") == "user"){
                    if (isChecked.value) {
                      controller.submitTenantSignature(widget.bookingId, _signatureController, civilTextController.text);
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please accept the terms and conditions.",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  }else{
                    if (isChecked.value) {
                      controller.submitSignature(widget.bookingId, _signatureController, civilTextController.text);

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
            ],
          ),
        ),
      ),
    );
  }
}

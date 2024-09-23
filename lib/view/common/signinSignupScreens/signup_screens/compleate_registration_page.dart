import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/signup_page_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class CompleateRegistrationPage extends StatefulWidget {
  final String role;
  const CompleateRegistrationPage({super.key, required this.role});

  @override
  State<CompleateRegistrationPage> createState() =>
      _CompleateRegistrationPageState();
}

class _CompleateRegistrationPageState extends State<CompleateRegistrationPage> {
  final SignupPageController controller = Get.find<SignupPageController>();
  // TextEditingController nationalityController = TextEditingController();
  // TextEditingController maritalStatusController = TextEditingController();
  // TextEditingController birthDateController = TextEditingController();
  // TextEditingController jobController = TextEditingController();
  // TextEditingController monthlyIncomeController = TextEditingController();
  TextEditingController aboutYouTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.role);
    // Get.put(
    //   DropdownController(
    //       ['Single', 'Married', 'Divorced', 'Widowed', 'Separated']),
    //   tag: 'maritalStatus',
    // );

    // Get.put(
    //   DropdownController([
    //     '2001-2010',
    //     '2011-2020',
    //   ]),
    //   tag: 'dateOfBirth',
    // );

    // Get.put(
    //   DropdownController([
    //     'Under 800 KD',
    //     'Between 800 - 1499 KD',
    //     'Between 1500 - 3000 KD',
    //     'Over 3000 KD',
    //   ]),
    //   tag: 'monthlyIncome',
    // );
    // Get.put(
    //   DropdownController([
    //     'Kuwait',
    //     'USA',
    //   ]),
    //   tag: 'nationality',
    // );
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/Logo.png",
                        width: MediaQuery.of(context).size.height * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColor.whiteColor,
                            child: Icon(Icons.arrow_back_ios_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: commonText("Complete Registration".tr,
                        size: 24, color: AppColor.blackColor, isBold: true),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Nationality".tr, size: 14, isBold: true),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropdown(
                          controller: controller.nationalityController,
                          hintText: "Select your nationality".tr),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Gender".tr, size: 14, isBold: true),
                      buildGenderRadioButtons(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Marital Status".tr, size: 14, isBold: true),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropdown(
                          controller: controller.maritalStatusController,
                          hintText: "Select your marital status".tr),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Date of Birth".tr, size: 14, isBold: true),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.selectDate(context);
                        },
                        child: Obx(() {
                          return commonTextfield(
                              controller.dateOfBirthController.value,
                              isEnable: false,
                              hintText: "YYYY-MM-DD".tr);
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.role == "Landlord"
                      ? SizedBox()
                      : commonTextfieldWithTitle(
                          "Job title".tr, controller.jobController,
                          hintText: "Enter your job title".tr,
                          keyboardType: TextInputType.visiblePassword),
                  widget.role == "Landlord"
                      ? SizedBox()
                      : const SizedBox(
                          height: 20,
                        ),
                  widget.role == "Landlord"
                      ? SizedBox()
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText("Income Bracket".tr,
                              size: 14, isBold: true),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdown(
                            controller: controller.monthlyIncomeController,
                            hintText: "Choose your income bracket".tr,
                          ),
                        ],
                      ),
                  widget.role == "Landlord"
                      ? SizedBox()
                      : const SizedBox(
                          height: 20,
                        ),
                  widget.role == "Landlord"
                      ? SizedBox(
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText("About You".tr,
                                  size: 14, isBold: true),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 320,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFCFCFC),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: Color(0xffD7D7D7),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: TextField(
                                        controller: aboutYouTextController,
                                        keyboardType: TextInputType.text,
                                        maxLines: 5,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: AppColor.blackColor,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                          hintText: "Tell us about yourself".tr,
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
                            ],
                          ),
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Obx(() {
                          return CheckboxListTile(
                            activeColor: AppColor.primaryColor,
                            title: commonText(
                                "I confirm that the information provided is truthful and accurate"
                                    .tr,
                                size: 14),
                            value: controller.isKycTermsAccepted.value,
                            onChanged: (bool? value) {
                              controller.isKycTermsAccepted.value = value!;
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return commonButton("Submit".tr,
                        isLoading: controller.isLoading.value, onTap: () {
                      if (controller.kycValidateForm()) {
                        controller.register();
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => IdentityVerificationScreen()),
                      // );
                    });
                  }),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGenderRadioButtons() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildRadioButton('Male'),
            buildRadioButton('Female'),
            buildRadioButton('Other'),
          ],
        ));
  }

  Widget buildRadioButton(String role) {
    return Row(
      children: [
        Radio<String>(
          value: role,
          groupValue: controller.gender.value,
          onChanged: (String? value) {
            controller.selectGender(value!);
          },
          activeColor: Colors.orange,
        ),
        commonText(
          role.tr,
          color: role == controller.gender.value ? Colors.orange : Colors.black,
          isBold: role == controller.gender.value ? true : false,
        ),
      ],
    );
  }
}

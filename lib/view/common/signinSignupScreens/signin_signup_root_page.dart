import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signup_screens/signup_page.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/signin_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginChooserScreen extends StatefulWidget {
  const LoginChooserScreen({super.key});

  @override
  State<LoginChooserScreen> createState() => _LoginChooserScreenState();
}

class _LoginChooserScreenState extends State<LoginChooserScreen> {
  final controller = Get.put(LoginChooserController());
  final loginViewModel = Get.put(SigninViewModel());
  String role = "";
  String languageData = "en";

  @override
  void initState() {
 //   languageData = "en";
    getLanguageData();
    super.initState();
  }

  getLanguageData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? language = sp.getString("language");
    print("<<<<<<<<<<<<<<<<<<<<<<<<<< ${language.toString()}");
    setState(() {
      languageData = language.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>> $languageData");
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/images/bg-image.jpg",fit: BoxFit.fill,)),
        const Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Obx(
            //   () => Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: List.generate(
            //       3,
            //       (index) => AnimatedContainer(
            //         duration: const Duration(milliseconds: 300),
            //         height: 8,
            //         width: 43,
            //         margin: const EdgeInsets.symmetric(horizontal: 5),
            //         decoration: BoxDecoration(
            //           color: controller.pageControllerValue.value == index
            //               ? AppColor.primaryColor
            //               : Colors
            //                   .grey, // Adjust active and inactive dot colors
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ]),
        )
      ]),
      bottomSheet: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              commonText(
                'Welcome!'.tr,
                size: 24,
                isBold: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              commonText(
                'A Premier Real Estate Professional.'.tr,
                size: 14,
                color: Colors.grey[600]!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Obx(() {
                return _buildRoleCard(
                  context,
                  icon: Icons.home_work,
                  groupValue: controller.selectedValue.value,
                  text: "Landlord".tr,
                  value: 1,
                  onTap: (int? value, String? text) {
                    role = text!;
                    controller.setSelectedValue(value!);
                  },
                );
              }),
              const SizedBox(height: 12.0),
              Obx(() {
                return _buildRoleCard(
                  context,
                  groupValue: controller.selectedValue.value,
                  icon: Icons.key,
                  text: "Tenant".tr,
                  value: 2,
                  onTap: (int? value, String? text) {
                    role = text!;
                    controller.setSelectedValue(value!);
                  },
                );
              }),
              const SizedBox(height: 20.0),
              Obx(() {
                return commonButton("Next".tr, onTap: () {
                  if (controller.selectedValue.value == 0) {
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignupPage(
                                role: role,
                              )),
                    );
                  }
                },
                    color: (controller.selectedValue.value == 0)
                        ? Colors.orange.shade200
                        : AppColor.primaryColor);
              }),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(child: Divider()),
                 SizedBox(width: 20,),
                 commonText("Or".tr),
                  SizedBox(width: 20,),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 10.0),
              commonBorderButton("Login".tr,onTap: () => Get.to(() => SigninPage())),
              const SizedBox(height: 20.0),
            ],
          )),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required IconData icon,
    required String text,
    required int value,
    required int? groupValue,
    required Function(int?, String?) onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(value, text),
      child: Container(
        decoration: BoxDecoration(
          color: value == groupValue ? Colors.orange : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 2,
            color: value == groupValue ? Colors.transparent : Colors.black12,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: (controller.selectedValue.value == value)
                              ? Colors.transparent
                              : AppColor.blackColor),
                      shape: BoxShape.circle,
                      color: AppColor.whiteColor,
                    ),
                    child: Icon(
                      icon,
                      size: 24.0,
                      color: value == groupValue
                          ? Colors.orange
                          : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "I'm a".tr,
                        style: TextStyle(
                          fontSize: 18,
                          color: value == groupValue
                              ? AppColor.whiteColor
                              : Colors.black,
                        ),
                      ),
                      Text(
                        " $text",
                        style: TextStyle(
                          fontSize: 18,
                          color: value == groupValue
                              ? AppColor.whiteColor
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: languageData == "en"? Alignment.topRight : languageData == "ar"? Alignment.topLeft : Alignment.topRight,
              child: Radio<int>(
                value: value,
                groupValue: groupValue,
                onChanged: (int? newValue) {
                  onTap(newValue, text);
                },
                activeColor: AppColor.whiteColor,
                fillColor: WidgetStateProperty.all(
                  value == groupValue ? AppColor.whiteColor : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginChooserController extends GetxController {
  var selectedValue = 0.obs;
  var isLoginPage = false.obs;
  var pageControllerValue = 0.obs;
  var obscuringCharacter = false.obs;

  void setSelectedValue(int value) {
    selectedValue.value = value;
    log(value.toString());
    if (value == 1 || value == 2) {
      pageControllerValue.value = 1;
    }
  }

  void setisLoginvalueValue(bool value) {
    isLoginPage.value = value;
    if (value == true) {
      pageControllerValue.value = 3;
    }
  }

  void setobscuringCharacterValue() {
    obscuringCharacter.value = !obscuringCharacter.value;
  }
}

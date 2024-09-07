import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/viewModel/controllers/language_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/onboardingScreens/onboarding_page.dart';

import '../signinSignupScreens/signin_screens/signin_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController controller = Get.put(LanguageController());
    final Map<String, String> countryCodes = {
      'English':
          'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg',
      'العربية':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/640px-Flag_of_Kuwait.svg.png'
    };
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Image.asset(
                        "assets/images/Logo.png",
                        width: MediaQuery.of(context).size.height * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      commonText(
                          "Presented by Digital Oasis Real Estate\nBrokerage Company (O.P.C)"
                              .tr),
                      const SizedBox(
                        height: 40,
                      ),
                    //  commonText("Your All-in-one rental solution".tr, size: 16),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Select your language".tr,
                          size: 16, isBold: true),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            /*boxShadow: const [
                              BoxShadow(blurRadius: 0.5, offset: Offset(1, 1))
                            ],*/
                            color: AppColor.whiteColor,
                            border:
                                Border.all(width: 1, color: const Color(0xffD7D7D7))),
                        child: DropdownButtonHideUnderline(
                          child: Obx(
                            () => DropdownButton<String>(
                              iconSize: 25,
                              value: controller.selectedCountry.value,
                              onChanged: (String? newValue) {
                                controller.selectCountryCode(newValue!);
                              },
                              borderRadius: BorderRadius.circular(10),
                              items: countryCodes.keys
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          countryCodes[value]!,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      commonText(value,
                                          color: AppColor.primaryColor, size: 14),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninPage()),
                      );
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color.fromRGBO(243, 146, 0, 1),
                      ),
                      child: Center(
                          child: commonText("Get Started".tr,
                              size: 16, color: AppColor.whiteColor)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/images/splashScreen/splashScreenImage.png",
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

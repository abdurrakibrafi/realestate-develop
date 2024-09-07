import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/viewModel/controllers/onboarding_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  final controller = Get.put<OnboardingController>(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: AppColor.whiteColor,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingData.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          controller.onboardingData[index].image,
                          fit: BoxFit.cover,
                        )),
                  );
                },
              ),
              Positioned(
                top: 15,
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninPage(),
                      ),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: commonText("Skip".tr, size: 16,color: Colors.white)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8,
                          width: controller.currentPage.value == index
                              ? 43
                              : 43, // Adjust the size of the active dot
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? AppColor.primaryColor
                                : Colors
                                    .grey, // Adjust active and inactive dot colors
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 251,
                    decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(),
                          commonText("New Place, New Home!".tr,
                              size: 24, isBold: true),
                          commonText(
                              "\nAre you ready to uproot and start over in a new\narea? Placoo will help you on your journey!\n".tr,
                              textAlign: TextAlign.center,
                              size: 14),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.currentPage.value == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SigninPage(),
                                        ),
                                      );
                                    } else {
                                      controller.pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color.fromRGBO(243, 146, 0, 1),
                                    ),
                                    child: Center(
                                        child: commonText("Get Started".tr, size: 18,color: AppColor.whiteColor)
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

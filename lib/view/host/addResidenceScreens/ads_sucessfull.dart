import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/profileScreens/profile_page.dart';

class AdsSuccessfull extends StatelessWidget {
  const AdsSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/icons/Password Succesfully Ilustration.png"),
                const SizedBox(
                  height: 20,
                ),
                commonText("Congratulations!".tr, size: 20, isBold: true),
                const SizedBox(
                  height: 5,
                ),
                commonText("Your ad has been successfully boosted".tr,
                    textAlign: TextAlign.center,
                    size: 14,
                    color: AppColor.darkGreyColor),
                const SizedBox(
                  height: 10,
                ),
                commonText("Fri, October 4, 6:00 PM", size: 14, isBold: true),
                SizedBox(
                  height: 40,
                ),
                commonButton(
                  "Go to Profile",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProfilePage(isHost: true, isGuest: true);
                      },
                    ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

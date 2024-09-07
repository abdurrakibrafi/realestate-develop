import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/otp_page.dart';

class SendOtpPage extends StatefulWidget {
  const SendOtpPage({super.key});

  @override
  State<SendOtpPage> createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("OTP".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          commonText(
              "Press continue to send an OTP to your email to reset your password"
                  .tr,
              size: 16),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.blackColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
                leading: Container(
                  height: 70,
                  width: 70,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColorLight,
                    shape: BoxShape.circle,
                  ),
                  child: const ImageIcon(
                    color: AppColor.primaryColor,
                    AssetImage(
                      "assets/icons/messageIcon2.png",
                    ),
                  ),
                ),
                title: commonText("via email:".tr, size: 12),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText("and***ley@yourdomain.com",
                        size: 12, isBold: true),
                  ],
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          commonButton(
            "Continue".tr,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OtpPage(
                          email: "",
                          isFromAuth: true,
                        )),
              );
            },
          )
        ]),
      ),
    );
  }
}

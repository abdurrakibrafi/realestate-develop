import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/profileScreens/change_password_page.dart';
import 'package:real_estate_management/view/common/profileScreens/select_language_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signup_screens/confirm_identity_page.dart';

import '../../../../viewModel/controllers/profileControllers/profile_controller.dart';

class SettingsPage extends StatefulWidget {
  final bool isHost;
  const SettingsPage({super.key, required this.isHost});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final ProfileController profileController =
  Get.put(ProfileController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Settings".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChnagePasswordPage()),
                );
              },
              child: _buildSettingOption(
                context,
                icon: Icons.lock_outline,
                text: 'Change Password'.tr,
                trailingIcon: Icons.arrow_forward_ios,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectLanguagePage()),
                );
              },
              child: _buildSettingOption(
                context,
                icon: Icons.language,
                text: 'Language'.tr,
                trailingIcon: Icons.arrow_forward_ios,
              ),
            ),
            const SizedBox(height: 10),
            profileController.profileData.value!.isVerified == false?   Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmIdentity()),
                    );
                  },
                  child: _buildSettingOption(
                    context,
                    icon: Icons.verified_user_outlined,
                    text: 'Identify Verification'.tr,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ):SizedBox(),
            InkWell(
              onTap: () {
                _showDeleteDialog(context);
              },
              child: _buildSettingOption(
                context,
                icon: Icons.delete_outlined,
                text: 'Delete account'.tr,
                trailingIcon: null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption(BuildContext context,
      {required IconData icon, required String text, IconData? trailingIcon}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF1F1F2)),
                  child: Icon(icon, color: AppColor.primaryColor)),
              const SizedBox(width: 10),
              commonText(text, color: AppColor.primaryColor, size: 18),
            ],
          ),
          if (trailingIcon != null)
            Icon(
              trailingIcon,
              color: AppColor.primaryColor,
              size: 15,
            ),
        ],
      ),
    );
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
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      commonText('Do you want to delete'.tr,
                          size: 20.0, isBold: true),
                      commonText("Sure want to delete your account", size: 14)
                    ],
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
                            side: const BorderSide(color: AppColor.whiteColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle No action
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: commonText('Cancle'.tr,
                                isBold: true,
                                color: AppColor.blackColor,
                                size: 16),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: commonText(
                              'Yes, Delete'.tr,
                              size: 16,
                              color: Colors.white,
                            ),
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

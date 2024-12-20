import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/main.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/utils/app_constant.dart';
import 'package:real_estate_management/view/common/profileScreens/gettingPaidPages/getting_paid.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/add_residence_page.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/my_booking_page.dart';
import 'package:real_estate_management/view/common/profileScreens/maintenanceRequestPages/maintenance_request_page.dart';
import 'package:real_estate_management/view/common/profileScreens/paymentHistoryPages/payment_history_page.dart';
import 'package:real_estate_management/view/common/profileScreens/personal_info_page.dart';
import 'package:real_estate_management/view/common/profileScreens/settings/settings_page.dart';
import 'package:real_estate_management/view/common/profileScreens/tutorials/tutorial_screen.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/view/host/bookingRequestScreens/reservation_list_page.dart';
import 'package:real_estate_management/view/host/myResidenceScreens/my_residence_page.dart';
import 'package:real_estate_management/viewModel/controllers/ResidencesControllers/residences_controller.dart';
import 'package:real_estate_management/viewModel/controllers/profileControllers/profile_controller.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splashScreens/signpage.dart';
import 'incomePages/income_page.dart';

class ProfilePage extends StatefulWidget {
  final bool isHost;
  final bool isGuest;
  const ProfilePage({super.key, required this.isHost, required this.isGuest});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserPreference userPreference = UserPreference();
  final ProfileController profileController =
      Get.put(ProfileController(), permanent: false);

  @override
  void initState() {
    // Defer the navigation to the next frame to avoid calling setState() during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (LocalStorage.getData(key: AppConstant.token) == null) {
        Get.off(() => SigninPage(), transition: Transition.fade);
      }else{

      }
    });
    super.initState();
  }

  final WidgetStateProperty<Color?> trackColor =
      WidgetStateProperty.resolveWith<Color?>(
    (Set<WidgetState> states) {
      // Track color when the switch is selected.
      if (states.contains(WidgetState.selected)) {
        return AppColor.primaryColor;
      }
      if (states.contains(WidgetState.disabled)) {
        return AppColor.primaryColor;
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: 16.0),
        //   child: CircleAvatar(
        //     backgroundColor: AppColor.whiteColor,
        //     child: Icon(Icons.arrow_back_ios_rounded),
        //   ),
        // ),
        backgroundColor: Color(0xff263238),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => _buildHeader(),),
            const SizedBox(
              height: 10,
            ),
            _buildSettingsList(context),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      )
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff263238),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipOval(
              child:  profileController.profileData.value?.image == null || profileController.profileData.value?.image == ""?
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.whiteColor,width: 2),
                    color: AppColor.primaryColor
                ),
                child: Center(
                  child: Text(
                    profileController.profileData.value?.name?.substring(0, 1).toUpperCase() ?? '',
                    style: TextStyle(color: AppColor.whiteColor,fontSize: 50),
                    softWrap: true,  // Enable text wrapping
                  ),
                )
              )
                  : Image.network(
                profileController.profileData.value!.image.toString(),
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 10),
            commonText("${profileController.profileData.value?.name}",
                size: 20, color: AppColor.whiteColor, isBold: true),
            commonText(
             "${ profileController.profileData.value?.email}",
              color: AppColor.whiteColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: commonText(
                        profileController.profileData.value?.role == "user"
                            ? "Tenant".tr
                            : "Landlord".tr,
                        color: AppColor.primaryColor)),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      (profileController.profileData.value?.isVerified == true)
                          ? const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 10,
                              backgroundImage: AssetImage(
                                "assets/icons/verifiedIcon.png",
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        width: 3,
                      ),
                      commonText(
                          profileController.profileData.value?.isVerified ==
                                  true
                              ? "Verified".tr
                              : "Unverified".tr),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(profileController
                              .profileData.value?.nationality ==
                          "Kuwait"
                      ? 'assets/icons/arb.png'
                      : 'assets/icons/eng.png',
                ))
              ],
            ),
            const SizedBox(height: 10),
            // commonText(
            //   email,
            //   size: 12,
            //   color: Colors.white70,
            // ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSettingsItem(
              "assets/icons/profile/profile.png", 'Personal Details'.tr, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfile(
                        data: profileController.profileData.value!,
                      )),
            );
          }),
          Visibility(
            visible: profileController.profileData.value?.role.toString() == "landlord",
            child: Column(
              children: [

               /* _buildSettingsItem(
                    "assets/icons/profile/gettingpaid.png", 'Getting Paid'.tr,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GettingPaid()),
                  );
                }),*/
                _buildSettingsItem("assets/icons/myResidencesIcon.png",
                    'My Listings'.tr, () {
                      Get.delete<ResidencesController>();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyResidencePage()),
                      );
                    }),
                _buildSettingsItem("assets/icons/addResidencesIcon.png",
                    'Add Listings'.tr, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddResidencePage(
                              isEdit: false,
                            )),
                      );
                    }),
                _buildSettingsItem("assets/icons/bookingRequestIcon.png",
                    'New Booking'.tr, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReservationListPage()),
                      );
                    }),
                _buildSettingsItem("assets/icons/profile/request.png",
                    'Maintenance Request'.tr, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MaintenanceRequestPage()),
                  );
                }),

                // _buildSettingsItem("assets/icons/profile/mysubscription.png",
                //     'Subscriptions'.tr, () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SubscriptionsPage()),
                //   );
                // }),
                // _buildSettingsItem("assets/icons/profile/mysubscription.png",
                //     'My Subscriptions'.tr, () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MySubscriptionsPage()),
                //   );
                // }),
              ],
            ),
          ),
          Visibility(
            visible: profileController.profileData.value?.role == "user",
            child: Column(
              children: [
                _buildSettingsItem(
                    "assets/icons/profile/house (1).png", 'Booking'.tr, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyBookingPage()),
                  );
                }),
                _buildSettingsItem(
                    "assets/icons/profile/card.png", 'Payments'.tr, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentHistoryPage()),
                  );
                }),
              ],
            ),
          ),
          _buildSettingsItem("assets/icons/profile/settings.png", 'Settings'.tr,
              () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SettingsPage(
                        isHost: widget.isHost,
                      )),
            );
          }),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       commonText(
          //         "Switch to ${!isLandloard ? "Landlord" : "Tenant"} Account",
          //         size: 16,
          //       ),
          //       Switch(
          //         value: isLandloard,
          //         trackOutlineColor: MaterialStateProperty.resolveWith(
          //           (final Set<MaterialState> states) {
          //             if (states.contains(MaterialState.selected)) {
          //               return null;
          //             }

          //             return AppColor.primaryColor;
          //           },
          //         ),
          //         focusColor: AppColor.primaryColor,
          //         activeColor: AppColor.primaryColor,
          //         activeTrackColor: AppColor.primaryColor,
          //         inactiveThumbColor: AppColor.primaryColor,
          //         inactiveTrackColor: AppColor.primaryColor,
          //         thumbColor:
          //             const MaterialStatePropertyAll<Color>(Colors.white),
          //         onChanged: (bool value) {
          //           setState(() {
          //             isLandloard = value;
          //           });
          //         },
          //       )
          //     ],
          //   ),
          // ),
          _buildSettingsItem("assets/icons/tutor.png", 'Tutorials'.tr,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TutorialScreen()),
                );
              }),
          _buildSettingsItem("assets/icons/profile/logout.png", 'Logout'.tr,
              () {
            userPreference.removeUser().then((value) {
/*              SharedPreferences sp = await SharedPreferences.getInstance();
              String? language =  sp.getString("language");
              sp.setString("language", language.toString());*/
            LocalStorage.removeData(key: AppConstant.token);
              //resetApp();
              Get.offAll(const SigninPage());
            });
          }),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String icon, String title, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: AppColor.whiteColor,
          child: ListTile(
            leading:
                // Image.asset(icon),
                Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 246, 235),
                  borderRadius: BorderRadius.circular(8)),
              child: ImageIcon(
                AssetImage(icon),
                color: AppColor.primaryColor,
              ),
            ),
            title: commonText(
              title,
              size: 16,

              // textAlign:(condition for arabic screen)? TextAlign.right:TextAlign.left
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.blackColor,
              size: 15,
            ),
            onTap: onTap,
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

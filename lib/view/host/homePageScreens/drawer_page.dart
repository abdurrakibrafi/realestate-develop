import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/main.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/my_booking_page.dart';
import 'package:real_estate_management/view/common/profileScreens/settings/settings_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/add_residence_page.dart';
import 'package:real_estate_management/view/host/bookingRequestScreens/reservation_list_page.dart';
import 'package:real_estate_management/view/host/myResidenceScreens/my_residence_page.dart';
import 'package:real_estate_management/viewModel/controllers/ResidencesControllers/residences_controller.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

import '../../../viewModel/controllers/profileControllers/profile_controller.dart';

Widget customStartDrawer(BuildContext context, String name) {
  UserPreference userPreference = UserPreference();
  final ProfileController profileController =
  Get.put(ProfileController(), permanent: false);
  print("${LocalStorage.getData(key: "role")} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  return Drawer(
      backgroundColor: AppColor.whiteColor,
      surfaceTintColor: Colors.transparent,
      elevation: 16.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            // ClipOval(
            //   child: Image.asset(
            //     "assets/sampleImages/profileSampleImage2.png",
            //     width: 50,
            //     height: 50,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.close),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/sampleImages/profileSampleImage2.png",
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText("Welcome!".tr, size: 14, isBold: true),
                    commonText(name.tr, size: 12),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          profileController.profileData.value?.role == "user"?
            commonMenu("assets/icons/bookingRequestIcon.png", "My Bookings".tr,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyBookingPage()),
                  );
                })

                :Column(
              children: [
                commonMenu("assets/icons/myResidencesIcon.png", "My Listings".tr,
                        () {
                      Get.delete<ResidencesController>();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyResidencePage()),
                      );
                    }),
                const Divider(),
                commonMenu("assets/icons/addResidencesIcon.png", "Add Listings".tr,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddResidencePage(
                              isEdit: false,
                            )),
                      );
                    }),
                const Divider(),
                commonMenu("assets/icons/bookingRequestIcon.png", "New Booking".tr,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReservationListPage()),
                      );
                    }),
              ],
            ),
            const Divider(),
            // commonMenu("assets/icons/subscriptionIcon.png", "Subscription".tr,
            //     () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const SubscriptionsPage()),
            //   );
            // }),
            // commonMenu(
            //     "assets/icons/subscriptionIcon.png", "My Subscription".tr, () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const MySubscriptionsPage()),
            //   );
            // }),

            commonMenu("assets/icons/settingIcon.png", "Settings".tr, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsPage(
                          isHost: true,
                        )),
              );
            }),
            const Divider(),
            commonMenu("assets/icons/logout.png", "Logout".tr, () {
              userPreference.removeUser().then((value) {
               // resetApp();
                Get.offAll(const SigninPage());
              });
            }, isLogout: true),
          ],
        ),
      ));
}

Widget commonMenu(String iconAsset, String title, VoidCallback? onTap,
    {bool isLogout = false}) {
  return ListTile(
    onTap: onTap,
    leading: ImageIcon(
      AssetImage(iconAsset),
      color: AppColor.primaryColor,
    ),
    title: commonText(title, size: 14),
    trailing: (isLogout)
        ? null
        : const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
  );
}

Widget customEndDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: AppColor.whiteColor,
    surfaceTintColor: Colors.transparent,
    elevation: 16.0,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText("Filter".tr, size: 16),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/icons/closeIcon.png")),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            commonText("Property Type".tr, size: 16),
            const Divider(),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                customBox("Home".tr),
                customBox("Farm".tr),
                customBox("Apartment".tr),
                customBox("Chalet".tr),
                customBox("Land".tr),
                customBox("Commercial".tr),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            commonButton("Apply".tr)
          ],
        ),
      ),
    ),
  );
}

Widget customBox(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColor.primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: commonText(text, size: 12, color: AppColor.primaryColor),
  );
}

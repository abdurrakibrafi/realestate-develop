import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';

import '../guest_root_screen.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 120,),
          Image.asset("assets/icons/common/success.png",scale: 4,),
          SizedBox(height: 24,),
          commonText("Success!".tr,size: 20,isBold: true),
          SizedBox(height: 24,),
          commonText("Your booking has been finalized and the legal agreement is now in effect".tr,size: 14,isBold: false,textAlign: TextAlign.center),
          SizedBox(height: 24,),
          commonText("Regards".tr,size: 15,isBold: true),
          commonText("The Mosta’ajer App Team",size: 15,isBold: true),
          SizedBox(height: 160,),
          commonButton("Go to home".tr,onTap: () =>  Get.offAll(() => GuestRootScreen())),
          SizedBox(height: 24,),
        ],
      ),
    );
  }
}

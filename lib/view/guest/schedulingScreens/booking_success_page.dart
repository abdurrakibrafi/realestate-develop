import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/controller/booking/contract_generate_controller.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../guest_root_screen.dart';

class BookingSuccessPage extends StatelessWidget {
  final String? BookingId;
   BookingSuccessPage({super.key,    this.BookingId});

  final ContractGenerateController contractGenerateController = Get.put(ContractGenerateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
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

            BookingId == "" || BookingId == null? SizedBox() : Obx(() => contractGenerateController.isLoading.value == true? Center(child: CircularProgressIndicator(),) : commonButton("View Contract".tr,onTap: () {
              contractGenerateController.getContractGenerate(bookingId: BookingId!);
            }),),

            SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}

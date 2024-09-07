import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class CancleProcessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Pricing".tr,
            size: 16, isBold: true, color: AppColor.blackColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.blackColor,
            ),
            child: const ImageIcon(
              color: AppColor.whiteColor,
              AssetImage("assets/icons/menu.png"),
              size: 24.0,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.blackColor,
              ),
              child: const ImageIcon(
                color: AppColor.whiteColor,
                AssetImage("assets/icons/Notification.png"),
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(context),
              SizedBox(height: 20),
              commonText("Cancellation Policy",
                  size: 40, isBold: true, color: Colors.orange),
              SizedBox(height: 10),
              commonText(
                "By making a reservation through our mobile app, guests and hosts agree to adhere to:",
                size: 14,
                color: AppColor.darkGreyColor,
              ),
              SizedBox(height: 20),
              _buildPricingInfo(
                description:
                    "Free Cancellation: Guests can cancel their reservation free of charge within 24 hours of booking.\nCancellation 7 Days Before Check-in: If a guest cancels at least 7 days before check-in, they will receive a full refund minus the service fee .\n Updates to Policy: This cancellation policy may be updated periodically. Guests and hosts will be notified of any significant changes .",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 40,
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: AppColor.blackColor, width: 1)),
        child: TextField(
          onTap: () {},
          enabled: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(2.0),
            hintText: "Search for a Property".tr,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColor.darkGreyColor,
            ),
            border: InputBorder.none,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: ImageIcon(
                AssetImage("assets/icons/searchIcon.png"),
                size: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPricingInfo({required String description}) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(description, size: 16, color: AppColor.blackColor),
          ],
        ),
      ),
    );
  }
}

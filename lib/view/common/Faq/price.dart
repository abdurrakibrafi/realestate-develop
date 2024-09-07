import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class PricingPage extends StatelessWidget {
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
              commonText("Pricing",
                  size: 40, isBold: true, color: Colors.orange),
              SizedBox(height: 10),
              commonText(
                "Learn more about our pricing and fees policy. If you have any questions, please contact us. We're here to assist you!",
                size: 14,
                color: AppColor.darkGreyColor,
              ),
              SizedBox(height: 20),
              _buildPricingInfo(
                title: "Transaction Fee:",
                description:
                    "We charge a 5% fee on each transaction. This fee is included in the total payable price for each booking. The listed price you set for your property will automatically include this fee. This fee helps us provide multiple payment options for our customers, making it easier to attract more renters and ensuring a seamless transaction without delays.",
              ),
              SizedBox(height: 20),
              _buildPricingInfo(
                title: "Recurring Payments:",
                description:
                    "Subscription payments are recurring and will be charged automatically at the start of each billing cycle. You can manage or cancel your subscription at any time through the account settings in the app.",
              ),
              SizedBox(height: 20),
              _buildTipsForLandlords(),
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

  Widget _buildPricingInfo(
      {required String title, required String description}) {
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
            commonText(title, size: 16, isBold: true),
            SizedBox(height: 10),
            commonText(description, size: 16, color: AppColor.blackColor),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsForLandlords() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText("Tips For Landlords".tr,
                    size: 16, isBold: true, color: Colors.white),
                SizedBox(height: 5),
                commonText(
                  "Learn how to set competitive prices to maximize returns.",
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 5, color: AppColor.blackColor),
              image: DecorationImage(
                image: NetworkImage(
                    "https://via.placeholder.com/150"), // Replace with actual image
                fit: BoxFit.cover,
              ),
            ),
            child: Icon(Icons.play_circle_fill, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}

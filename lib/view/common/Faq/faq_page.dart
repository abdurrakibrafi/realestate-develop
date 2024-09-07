import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class FAQPage extends StatelessWidget {
  final List<String> faqQuestions = [
    "How do I get started with the app?",
    "Is there a fee to use the app?",
    "How are tenants vetted?",
    "What payment methods available?",
    "Can I collect rent on the App?",
    "How to send maintenance requests?",
    "Can I update my bank details?",
    "Can I update my property details?",
    "Is my information secure?",
    "My payment shows as failed, but I was charged?",
    "My payment shows as pending on my bank account?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("FAQ".tr,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchBar(context),
            SizedBox(height: 20),
            commonText("F.A.Q",
                size: 40, isBold: true, color: AppColor.primaryColor),
            SizedBox(height: 10),
            commonText(
              "These are some questions we hear a lot. If you have other questions, don't hesitate to contact us. We're here to assist you!",
              size: 14,
              color: AppColor.darkGreyColor,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: faqQuestions.length,
                itemBuilder: (context, index) {
                  return _buildFAQItem(faqQuestions[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            commonButton(
              "Contact Us",
            ),
          ],
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

  Widget _buildFAQItem(String question) {
    return Card(
      elevation: 2,
      color: AppColor.whiteColor,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: commonText(question, size: 14, isBold: true),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 16, color: AppColor.primaryColor),
        onTap: () {
          // Handle FAQ item tap
        },
      ),
    );
  }
}

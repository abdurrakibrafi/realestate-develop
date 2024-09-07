import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/host/editResidenceScreens/edit_photo.dart';

class EditPropertyPage2ndPage extends StatelessWidget {
  EditPropertyPage2ndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Edit Property".tr, size: 18),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildLabelText("Governorate"),
              commonText("Hawalli", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("Area"),
              commonText("Hawalli", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("Block"),
              commonText("4", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("Street"),
              commonText("404 St", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("House/Building"),
              commonText("09"),
              const SizedBox(height: 10),
              _buildLabelText("Floor"),
              commonText("6th", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("Apartment"),
              commonText("Hawalli Tower", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("PACI No."),
              commonText("012993941", color: Colors.grey),
              const SizedBox(height: 10),
              _buildLabelText("House Rules"),
              commonText(
                color: Colors.grey,
                "This delightful residence boasts a blend of classic charm and modern conveniences, nestled in a serene neighborhood. The interiors are beautifully appointed with high-quality finishes and thoughtful details.",
              ),
              const SizedBox(height: 20),
              Center(
                child: commonButton("Submit".tr, onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditPhotoPage();
                    },
                  ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelText(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: commonText(label, size: 14, isBold: true),
    );
  }
}

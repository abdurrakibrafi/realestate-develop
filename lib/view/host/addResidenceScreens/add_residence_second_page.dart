import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class AddResidenceSecondPage extends StatelessWidget {
  const AddResidenceSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddResidenceController());
    return Scaffold(
      appBar: AppBar(
        title: commonText("Property Address".tr, size: 18),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  commonText("Governorate", size: 14, isBold: true),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                controller: controller.governorateController,
                hintText: "Select Governorate",
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  commonText("Area", size: 14, isBold: true),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                controller: controller.areaController,
                hintText: "Select Area",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "Block",
                controller.blockController,
                hintText: "Enter Block Number",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "Street",
                controller.streetController,
                hintText: "Enter Street Name/Number",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "House/Building",
                controller.houseController,
                hintText: "Enter House/Building Number",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "Floor",
                controller.floorController,
                hintText: "Enter Floor Number",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "Apartment",
                controller.apartmentController,
                hintText: "Enter Apartment Number",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "PACI No.",
                controller.paciNoController,
                hintText: "Enter PACI No. (optional)",
              ),
              const SizedBox(height: 16),
              commonTextfieldWithTitle(
                "House Rules",
                controller.rulesController,
                hintText: "Tell us about your house rules...",
                borderradious: 10,
                maxLine: 4,
              ),
              const SizedBox(height: 24),
              Obx(() {
                return commonButton(
                  "Submit".tr,
                  isLoading: controller.loading.value,
                  onTap: () {
                    if (controller.validateSecondPage()) {
                      controller.loginApi(false);
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

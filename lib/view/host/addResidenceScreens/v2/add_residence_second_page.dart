import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/add_residence_map.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class AddResidenceSecondPage extends StatelessWidget {
  final bool isEdit;
  const AddResidenceSecondPage({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddResidenceController>();
    return Scaffold(
      appBar: AppBar(
        title: commonText("Address".tr, size: 18),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              commonText("4", color: AppColor.primaryColor),
              commonText("/4"),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amber,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        // Wrapping the first Row with Flexible
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(() {

                             /* return SizedBox(
                                width: 200,
                                child: commonText(
                                  controller.address.value,
                                  maxLines: 2*/

                              return Flexible(
                                // Making the text flexible
                                child: commonText(
                                  controller.address.value,

                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const MapScreen());
                        },
                        child: commonText("Select Location".tr,
                            color: AppColor.primaryColor),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdown(
                  controller: controller.governorateController,
                  hintText: "Select Governorate"),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                var areas = controller.governorateToAreas[
                        controller.governorateController.selected.value] ??
                    [];
                controller.areaController.options = areas;
                if (!areas.contains(controller.areaController.selected.value)) {
                  controller.areaController.selected.value =
                      areas.isNotEmpty ? areas.first : "";
                }

                return CustomDropdown(
                    controller: controller.areaController,
                    hintText: "Select Area");
              }),
              commonTextfieldWithTitle(
                "",
                controller.houseController,
                hintText: "Building Number/No.",
              ),
              Row(
                children: [
                  Expanded(
                    child: commonTextfieldWithTitle(
                      "",
                      controller.apartmentController,
                      hintText: "Apartment No.",
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: commonTextfieldWithTitle(
                      "",
                      controller.floorController,
                      hintText: "Floor",
                    ),
                  )
                ],
              ),
              commonTextfieldWithTitle(
                "",
                controller.streetController,
                hintText: "Street Name/Number",
              ),
              Row(
                children: [
                  Expanded(
                    child: commonTextfieldWithTitle(
                      "",
                      controller.blockController,
                      hintText: "Block No.",
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: commonTextfieldWithTitle(
                      "",
                      controller.avenueController,
                      hintText: "Avenue (optional)",
                    ),
                  )
                ],
              ),
              commonTextfieldWithTitle(
                "",
                controller.aditionalController,
                hintText: "Additional Directions",
              ),
              const SizedBox(height: 24),
              Obx(() {
                return commonButton("Submit".tr,
                    isLoading: controller.loading.value, onTap: () {
                  if (controller.validateSecondPage()) {
                    controller.loginApi(isEdit);
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return WantPaymentScreen();
                  // }));
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}

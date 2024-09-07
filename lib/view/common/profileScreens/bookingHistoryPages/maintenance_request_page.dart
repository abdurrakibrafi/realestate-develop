import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/viewModel/controllers/maintenanceRequestControllers/create_maintenance_request_controller.dart';

class MaintenanceRequestGuestPage extends StatelessWidget {
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController apartmentController = TextEditingController();
  // final TextEditingController floorController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();

  // final MaintenanceRequestGuestPageController controller =
  //     Get.put(MaintenanceRequestGuestPageController());

  // final Map<String, String> countryCodes = {
  //   '+965':
  //       'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/640px-Flag_of_the_United_Arab_Emirates.svg.png',
  //   '+1':
  //       'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg',
  // };

  final String id;
  const MaintenanceRequestGuestPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    CreateMaintenanceRequestController createMaintenanceRequestController =
        Get.put(CreateMaintenanceRequestController(residenceId: id));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: commonText(
          'Report Issue',
          size: 24,
          isBold: true,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonTextfieldWithTitle(
                "Name", createMaintenanceRequestController.fullNameController,
                hintText: "Enter your full name".tr
            ),
            const SizedBox(height: 16),
            commonText("Phone Number".tr, size: 14),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButton<String>(
                        value: createMaintenanceRequestController
                            .selectedCountryCode.value,
                        onChanged: (String? newValue) {
                          createMaintenanceRequestController
                              .selectCountryCode(newValue!);
                        },
                        items: createMaintenanceRequestController
                            .countryCodes.keys
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Image.network(
                                  createMaintenanceRequestController
                                      .countryCodes[value]!,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 8),
                                commonText(value),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: commonTextfield(
                      createMaintenanceRequestController.phoneController,
                      hintText: "Phone number",
                      keyboardType: TextInputType.number),
                ),
              ],
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle("Apartment",
                createMaintenanceRequestController.apartmentController,
                hintText: "Apartment #"),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
                "Floor", createMaintenanceRequestController.floorController,
                hintText: "Floor"),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
                "Address", createMaintenanceRequestController.addressController,
                hintText: "Address"),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
                "Email", createMaintenanceRequestController.emailController,
                hintText: "Enter your email"),
            const SizedBox(height: 16),
            commonTextfieldWithTitle("Description of the issue",
                createMaintenanceRequestController.descriptionController,
                hintText: "Type here", maxLine: 5, borderradious: 10),
            const SizedBox(height: 16),
            commonText("Pictures (If any)".tr, size: 14, isBold: true),
            const SizedBox(height: 5),
            Obx(() {
              return createMaintenanceRequestController.pickedImage.value !=
                      null
                  ? Image.file(
                      createMaintenanceRequestController.pickedImage.value!,
                      height: 200,
                      width: double.infinity,
                    )
                  : DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [7, 7],
                      color: AppColor.primaryColor,
                      strokeWidth: 1,
                      borderPadding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue.shade50),
                        width: double.infinity,
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              radius: 24,
                              child: Image.asset(
                                  "assets/icons/document-upload.png"),
                            ),
                            commonText("Media".tr, size: 14, isBold: true),
                            commonText("Max. file size 10 MB"),
                            commonIconButton("Uploade", onTap: () {
                              createMaintenanceRequestController.pickImage();
                            },
                                icon: Image.asset("assets/icons/export.png"),
                                color: Colors.black87,
                                height: 40,
                                textSize: 16),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
            }),
            const SizedBox(height: 24),
            Obx(() {
              return commonButton(
                "Submit".tr,
                isLoading: createMaintenanceRequestController.loading.value,
                onTap: () {
                  if (createMaintenanceRequestController.validatePage()) {
                    createMaintenanceRequestController.callApi();
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

class MaintenanceRequestGuestPageController extends GetxController {
  var selectedCountryCode = '+965'.obs;

  void selectCountryCode(String item) {
    selectedCountryCode.value = item;
  }
}

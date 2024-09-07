import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/viewModel/controllers/profileControllers/select_language_page_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  final SelectLanguagePageController controller =
      Get.put(SelectLanguagePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
      ),
      body:   Image.asset("assets/images/bg-image.jpg",fit: BoxFit.fill,),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            commonText("Select Language".tr, size: 20, isBold: true),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [commonText("Select Language".tr, size: 16, isBold: true)],
            ),
            const SizedBox(
              height: 20,
            ),
            buildRadioButton("English",
                "https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg"),
            const SizedBox(
              height: 20,
            ),
            buildRadioButton("العربية",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/640px-Flag_of_Kuwait.svg.png"),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            commonButton(
              "Continue".tr,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioButton(String role, String url) {
    return Obx(() {
      return Row(
        children: [
          Radio<String>(
            value: role,
            groupValue: controller.selectedLanguage.value,
            onChanged: (String? value) {
              controller.selectRole(value!);
            },
            activeColor: Colors.orange,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  url,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              commonText(role, color: AppColor.primaryColor, size: 14),
            ],
          ),
        ],
      );
    });
  }
}

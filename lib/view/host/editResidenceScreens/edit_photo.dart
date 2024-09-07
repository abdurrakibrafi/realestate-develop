import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/host/editResidenceScreens/edit_video.dart';

class EditPhotoPage extends StatelessWidget {
  final List<String> photoUrls = [
    DummyImage.networkImage,
    DummyImage.networkImage,
    DummyImage.networkImage,
    DummyImage.networkImage,
    DummyImage.networkImage,
  ];

  EditPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Edit Photo".tr, size: 18, isBold: true),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(photoUrls[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: InkWell(
                      onTap: () {
                        // Handle photo removal
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/icons/cancle.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: photoUrls.length - 1, // Exclude the first item
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  // Offset index by 1 to skip the first item in the list
                  int actualIndex = index + 1;

                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(photoUrls[actualIndex]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            // Handle photo removal
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/icons/cancle.png"),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              commonBorderButton("Add New Photo"),
              const SizedBox(height: 20),
              commonButton(
                "Update",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditVideoPage();
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

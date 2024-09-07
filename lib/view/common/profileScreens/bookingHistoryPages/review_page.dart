import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/viewModel/controllers/ratingController/add_rating_controller.dart';

import '../../../../models/bookingModels/my_booked_model.dart';

class ReviewPage extends StatelessWidget {
  final Booked data;
  const ReviewPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    AddReviewController controller =
        Get.put(AddReviewController(residenceId: data.residence!.id!));
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          DummyImage.networkImage,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 250,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(27, 30, 28, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(28, 0, 34, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.orange),
                                    commonText(
                                        '${data.averageRating} (6.8K review)',
                                        color: AppColor.darkGreyColor),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 7, 10.2, 7),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColorLight,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: commonText(data.residence!.rentType!.tr,
                                    size: 12, color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 43.5, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 6),
                                        child: commonText(
                                            data.residence!.propertyName!,
                                            size: 20,
                                            isBold: true),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: commonText(
                                            data.residence!.address!.area!,
                                            size: 12,
                                            color: AppColor.darkGreyColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: commonText(
                              "Your overall rating of this booking".tr,
                              size: 14,
                              color: AppColor.superDarkGreyColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: RatingBar.builder(
                            itemSize: 35,
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              controller.ratingController.value.text =
                                  rating.toString();
                              log(rating.toString());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        commonTextfieldWithTitle("Add detailed review".tr,
                            controller.reviewDeatilsController,
                            hintText: "Enter here"),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: commonText("Add Photo".tr,
                              size: 14, isBold: true),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Container(
                        //     height: 100,
                        //     width: 100,
                        //     decoration: BoxDecoration(
                        //       color: AppColor.primaryColorLight,
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //     child: const Icon(
                        //       Icons.camera_alt_outlined,
                        //       size: 30,
                        //       color: AppColor.darkGreyColor,
                        //     )),
                        GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Obx(() {
                            return controller.pickedImage.value != null
                                ? SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: material.Image.file(
                                      controller.pickedImage.value!,
                                      height: 100,
                                      width: double.infinity,
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColorLight,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 30,
                                      color: AppColor.darkGreyColor,
                                    ));
                          }),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(() {
                          return commonButton("Submit".tr,
                              isLoading: controller.loading.value, onTap: () {
                            if (controller.validatePage()) {
                              controller.callApi();
                            }
                          });
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget commonTextfieldWithTitle(
    String title,
    TextEditingController controller, {
    String hintText = "",
    TextInputType keyboardType = TextInputType.text,
    String? assetIconPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: commonText(title, size: 14, isBold: true),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColorLight,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            maxLines: 3,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: keyboardType == TextInputType.visiblePassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColor.lightGreyColor),
              border: InputBorder.none,
              prefixIcon: assetIconPath != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ImageIcon(
                        AssetImage(assetIconPath),
                        size: 24.0,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

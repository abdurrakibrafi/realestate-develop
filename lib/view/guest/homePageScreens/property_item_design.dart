import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';

Widget itemDesign(AllResidence data) {
  return Card(
    color: AppColor.whiteColor,
    elevation: 4,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              data.images!.isNotEmpty
                  ? data.images?.first.url ?? DummyImage.networkImage
                  : DummyImage.networkImage,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                  DummyImage.networkImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: commonText(data.propertyName ?? "N/A",
                        size: 12, isBold: true),
                  ),
                  // Row(
                  //   children: [
                  //     const ImageIcon(
                  //       AssetImage("assets/icons/starIcon.png"),
                  //       color: AppColor.primaryColor,
                  //       size: 22.0,
                  //     ),
                  //     commonText('4.9',
                  //         size: 13, color: AppColor.lightGreyColor),
                  //   ],
                  // ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage("assets/icons/locationIcon.png"),
                    size: 15.0,
                  ),
                  Expanded(
                    child: commonText(data.address!.area ?? "N/A",
                        size: 10, color: AppColor.superDarkGreyColor),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        commonText(data.rent.toString(),
                            size: 12, color: AppColor.primaryColor),
                        commonText(' K.D /Month'.tr,
                            size: 12, color: Colors.grey),
                      ],
                    ),
                  ),
                  // Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 2, horizontal: 6),
                  //     decoration: BoxDecoration(
                  //       color: AppColor.primaryColorLight,
                  //       borderRadius: BorderRadius.circular(4.0),
                  //     ),
                  //     child: commonText("Apartment".tr,
                  //         size: 10, color: AppColor.primaryColor))
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';

Widget myResidenceitemDesign(AllResidence data) {
  return Card(
    color: AppColor.whiteColor,
    elevation: 2,
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
              height: 150,
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
                children: [
                  Expanded(
                      child: commonText(data.propertyName ?? "N/A", size: 13,maxLines: 2)),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage("assets/icons/starIcon.png"),
                        color: AppColor.primaryColor,
                        size: 22.0,
                      ),
                      commonText(data.averageRating.toString(),
                          size: 13, color: AppColor.darkGreyColor),
                    ],
                  ),
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
                  commonText(data.address!.area!,
                      size: 10, color: AppColor.darkGreyColor),
                  // const Spacer(),
                  // const Icon(Icons.more_horiz)
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

Widget itemDesign() {
  return Card(
    color: AppColor.whiteColor,
    elevation: 4,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/e03f/7d8a/d8ae4ba76838e5223e1fa99a41e10a71?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JR9GchOod~~g7MDUcX46PWbvTmW9FRNxiUEOuiRrFXllF4uZOvZhMCjzL5pzXUXAr-1L5YEKK2WRlRCCQq3hyFNvDwZYRMUgPKj-lNrCbz996n7qOlAeIfgMpg91jAF1UPRmGjc53xgY4lF8j638YG6L8sq-j1B4aOZXKnr~dJks0CMaKZ~wGFUHeKvRo2MV-ugbUU5Ouda8HwRIB7qfKQsuvvZBKvPcjrwDOuNmBvplF3HxKHmzLmCW8IMJa8b9KDYMTUNOotDZeCscIwQ2d9wernpbYPXWKJa0Xs8nu5SszMZPv11L8Ya42pOUhmEjQAm--4RAOhJuxQa~w3EdCg__', // Use the image URL from the list
            fit: BoxFit.cover,
            height: 100,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText('Sunset Ridge', size: 13),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage("assets/icons/starIcon.png"),
                        color: AppColor.primaryColor,
                        size: 22.0,
                      ),
                      commonText('4.9',
                          size: 13, color: AppColor.lightGreyColor),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText('\$540/month',
                      size: 10, color: AppColor.primaryColor),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorLight,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: commonText("Apartment",
                          size: 10, color: AppColor.primaryColor))
                ],
              ),
              const SizedBox(height: 4),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage("assets/icons/locationIcon.png"),
                    size: 15.0,
                  ),
                  Text(
                    'Avenue, West Side',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

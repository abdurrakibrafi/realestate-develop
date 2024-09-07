import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText("Popular".tr,
              size: 16, isBold: true, color: AppColor.darkGreyColor),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://s3-alpha-sig.figma.com/img/616c/9b24/08a00e4e6507e4d0c871c49897d21a1b?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LWvmQZA51MTs8qLFn1-tCqCOQjkQvZQg0o5csof6xxA-~FXbMNzaOokzPzAlP84x8EgAMueFPFwFiQIn4WscCSw0STkd6NRixzGXXV3NEzp4q0QIocDrmKG3ONYEkxQNb0gvRAfneCi5wjDVcW0ch3UGfMcYRn2bw2fPbXW2XQp7szjziPPvne9pBdBkgYKemJwl4iqLBIfx1sqSkfAoPqfW-1nC9Qa1jDWpkzwkWzUKj17MfkS0WNGZv9OsXByDM5YtEEaDs1iMGHlXCURt7-r8gvrNGJeav6vU5o4WVREB8v7NOvx3chllShIXt4QLnoo-TYhbcM254l7u7zU1Fw__',
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: AppColor.primaryColor,
                                            size: 20,
                                          ),
                                          commonText('4.9'),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 7, 10.2, 7),
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColorLight,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: commonText(
                                          'Apartment'.tr,
                                          size: 12,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  commonText(
                                    'Sunset Ridge Apartment',
                                    size: 16,
                                    isBold: true,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ImageIcon(
                                        AssetImage(
                                            "assets/icons/locationIcon.png"),
                                        color: AppColor.darkGreyColor,
                                      ),
                                      Expanded(
                                        child: commonText(
                                          '1012 Ocean avenue, New York, USA',
                                          color: AppColor.darkGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const ImageIcon(
                                            AssetImage(
                                                "assets/icons/sizeIcon.png"),
                                            color: AppColor.darkGreyColor,
                                          ),
                                          commonText("1,225"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const ImageIcon(
                                            AssetImage(
                                                "assets/icons/roomIcon.png"),
                                            color: AppColor.darkGreyColor,
                                          ),
                                          commonText("3.0"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          commonText(
                                            '\$340/',
                                            color: AppColor.primaryColor,
                                            isBold: true,
                                            size: 13,
                                          ),
                                          commonText(
                                            'Month'.tr,
                                            color: AppColor.primaryColor,
                                            isBold: true,
                                            size: 13,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}

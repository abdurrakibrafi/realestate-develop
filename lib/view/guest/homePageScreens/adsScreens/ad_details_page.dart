import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class AdsDetailsPage extends StatefulWidget {
  const AdsDetailsPage({super.key});

  @override
  State<AdsDetailsPage> createState() => _AdsDetailsPageState();
}

class _AdsDetailsPageState extends State<AdsDetailsPage> {
  int view = 60992;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Ad Details".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
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
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.network(
                          DummyImage
                              .networkImage, // Use the image URL from the list
                          fit: BoxFit.cover,
                          height: 300,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      commonText(
                                        'Woodland Apartment',
                                        size: 16,
                                        isBold: true,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
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
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/viewIcon.png",
                    ),
                    commonText(" views $view")
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: AppColor.primaryColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.phone_outlined,
                                  color: AppColor.whiteColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                commonText("Call Now".tr,
                                    size: 14, color: AppColor.whiteColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromRGBO(3, 214, 24, 1),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: AppColor.whiteColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                commonText("WhatsApp",
                                    size: 14, color: AppColor.whiteColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                            onTap: () {}, child: adsItemDesign()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget adsItemDesign() {
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                DummyImage.networkImage,
                fit: BoxFit.cover,
                width: double.infinity,
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
                      child: commonText('Sunset Ridge', size: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          commonText('\$540/',
                              size: 10, color: AppColor.primaryColor),
                          commonText('Month'.tr,
                              size: 10, color: AppColor.primaryColor),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColorLight,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: commonText("Apartment".tr,
                            size: 10, color: AppColor.primaryColor))
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
                      child: commonText('Avenue, West Side',
                          size: 10, color: AppColor.superDarkGreyColor),
                    ),
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
}

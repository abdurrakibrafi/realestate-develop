import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/viewModel/controllers/homeControllers/home_page_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/view/common/profileScreens/profile_page.dart';
import 'package:real_estate_management/view/host/homePageScreens/drawer_page.dart';
import 'package:real_estate_management/view/guest/homePageScreens/top_rated_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomePageController controller = Get.put(HomePageController());
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        key: _scaffoldKey,
        endDrawer: customEndDrawer(context),
        drawer: customStartDrawer(context, ""),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("Let's Begin The Search For".tr,
                      color: AppColor.darkGreyColor, isBold: true, size: 20),
                  commonText("The Perfect Property".tr,
                      color: AppColor.primaryColor, size: 24, isBold: true),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState!.openDrawer(),
                        child: Column(
                          children: [
                            const ImageIcon(
                              AssetImage("assets/icons/moreIcon.png"),
                              size: 24.0,
                            ),
                            commonText("More".tr, size: 10)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: commonTextfield(
                            searchController,
                            hintText: "Search for a Property".tr,
                            assetIconPath: "assets/icons/searchIcon.png",
                            isEnable: false,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: const ImageIcon(
                            AssetImage("assets/icons/endDrawer.png"),
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage(
                                      isHost: true,
                                      isGuest: false,
                                    )),
                          );
                        },
                        child: ClipOval(
                          child: Image.asset(
                            "assets/sampleImages/profileSampleImage2.png",
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          buildItem("Most Popular".tr,
                              "assets/icons/emoji_trophy.png"),
                          buildItem(
                              "Families".tr, "assets/icons/emoji_family.png"),
                          buildItem("Chalets".tr,
                              "assets/icons/emoji_beach_with_umbrella.png"),
                          buildItem(
                              "Apartments".tr, "assets/icons/emoji_houses.png"),
                          // buildItem("Farm House".tr),
                          // buildItem("Villa".tr),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 265,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const ItemDetails(
                            //             isHost: false,
                            //           )),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 250,
                              child: Card(
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
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                      child: Image.network(
                                        DummyImage.networkImage,
                                        fit: BoxFit.cover,
                                        height: 150,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              commonText('Town place walkups',
                                                  size: 14),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  commonText('\$540/',
                                                      size: 12,
                                                      color: AppColor
                                                          .primaryColor),
                                                  commonText('Month'.tr,
                                                      size: 12,
                                                      color: AppColor
                                                          .primaryColor),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              const Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                        "assets/icons/locationIcon.png"),
                                                    size: 15.0,
                                                  ),
                                                  Text(
                                                    'Avenue, West Side',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              color: AppColor.primaryColorLight,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: const ImageIcon(
                                              AssetImage(
                                                  "assets/icons/favoriteIcon.png"),
                                              color: AppColor.primaryColor,
                                              size: 24.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          commonText("Breaking The Internet".tr,
                              size: 16,
                              color: AppColor.darkGreyColor,
                              isBold: true),
                          SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            "assets/icons/emoji_fire.png",
                            width: 20,
                            height: 20,
                          )
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TopRatedPage()),
                            );
                          },
                          child: commonText("More".tr,
                              size: 13, color: AppColor.darkGreyColor))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const ItemDetails(
                          //             isHost: false,
                          //           )),
                          // );
                        },
                        // child: itemDesign()
                      );
                    },
                  )

                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: 20,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 5),
                  //           child: Card(
                  //             color: AppColor.whiteColor,
                  //             elevation: 4,
                  //             surfaceTintColor: Colors.transparent,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(12),
                  //             ),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 ClipRRect(
                  //                   borderRadius: const BorderRadius.vertical(
                  //                       top: Radius.circular(12)),
                  //                   child: Image.network(
                  //                     'https://s3-alpha-sig.figma.com/img/e03f/7d8a/d8ae4ba76838e5223e1fa99a41e10a71?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JR9GchOod~~g7MDUcX46PWbvTmW9FRNxiUEOuiRrFXllF4uZOvZhMCjzL5pzXUXAr-1L5YEKK2WRlRCCQq3hyFNvDwZYRMUgPKj-lNrCbz996n7qOlAeIfgMpg91jAF1UPRmGjc53xgY4lF8j638YG6L8sq-j1B4aOZXKnr~dJks0CMaKZ~wGFUHeKvRo2MV-ugbUU5Ouda8HwRIB7qfKQsuvvZBKvPcjrwDOuNmBvplF3HxKHmzLmCW8IMJa8b9KDYMTUNOotDZeCscIwQ2d9wernpbYPXWKJa0Xs8nu5SszMZPv11L8Ya42pOUhmEjQAm--4RAOhJuxQa~w3EdCg__', // Use the image URL from the list
                  //                     fit: BoxFit.cover,
                  //                     height: 200,
                  //                     width: double.infinity,
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           commonText('Sunset Ridge', size: 15),
                  //                           Row(
                  //                             children: [
                  //                               const ImageIcon(
                  //                                 AssetImage(
                  //                                     "assets/icons/starIcon.png"),
                  //                                 color: AppColor.primaryColor,
                  //                                 size: 22.0,
                  //                               ),
                  //                               commonText('(4.9)',
                  //                                   size: 12,
                  //                                   color: AppColor.blackColor),
                  //                             ],
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       const SizedBox(height: 4),
                  //                       Row(
                  //                         children: [
                  //                           commonText('\$540/',
                  //                               size: 12,
                  //                               color: AppColor.blackColor),
                  //                           commonText('Month'.tr,
                  //                               size: 12,
                  //                               color: AppColor.blackColor),
                  //                         ],
                  //                       ),
                  //                       const SizedBox(height: 4),
                  //                       const Row(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.center,
                  //                         children: [
                  //                           ImageIcon(
                  //                             AssetImage(
                  //                                 "assets/icons/locationIcon.png"),
                  //                             size: 15.0,
                  //                           ),
                  //                           Text(
                  //                             'Avenue, West Side',
                  //                             style: TextStyle(
                  //                               fontSize: 10,
                  //                               color: Colors.grey,
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // )
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildItem(String item, String path) {
    return GestureDetector(
      onTap: () {
        controller.selectItem(item);
      },
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: item == controller.selectedItem.value
                  ? AppColor.primaryColor
                  : AppColor.primaryColorLight,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: [
                commonText(
                  item,
                  isBold: true,
                  color: item == controller.selectedItem.value
                      ? Colors.white
                      : Colors.black,
                ),
                const SizedBox(
                  width: 2,
                ),
                Image.asset(
                  path,
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}

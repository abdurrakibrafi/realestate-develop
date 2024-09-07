import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/viewModel/controllers/homeControllers/home_page_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';

import 'package:real_estate_management/view/guest/homePageScreens/search_page.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomePageController controller = Get.put(HomePageController());
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            title: commonText("Search", size: 20, isBold: true),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage()),
                              );
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF2F2F3),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: TextField(
                                onTap: () {},
                                enabled: false,
                                controller: searchController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(2.0),
                                  hintText: "Search for a Property".tr,
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.darkGreyColor,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: ImageIcon(
                                      AssetImage("assets/icons/searchIcon.png"),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFF2F2F3),
                          ),
                          child: const ImageIcon(
                            color: AppColor.blackColor,
                            AssetImage("assets/icons/menu.png"),
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                          buildItem("Featured".tr,
                              path: "assets/icons/feature.png"),
                          buildItem(
                            "Furnished".tr,
                          ),
                          buildItem(
                            "Chalets".tr,
                          ),
                          buildItem(
                            "Apartments".tr,
                          ),

                          // buildItem("Farm House".tr),
                          // buildItem("Villa".tr),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
                ],
              ),
            ),
          )),
    );
  }

  Widget buildItem(String item, {String? path}) {
    return GestureDetector(
      onTap: () {
        controller.selectItem(item);
      },
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: item == controller.selectedItem.value
                  ? AppColor.primaryColor
                  : const Color(0xFFFF2F2F3),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: [
                if (path != null)
                  Image.asset(
                    path,
                    width: 15,
                    height: 15,
                    color: item == controller.selectedItem.value
                        ? Colors.white
                        : Colors.black45,
                  ),
                if (path != null)
                  const SizedBox(
                    width: 2,
                  ),
                commonText(
                  item,
                  isBold: true,
                  color: item == controller.selectedItem.value
                      ? Colors.white
                      : Colors.black,
                ),
              ],
            ),
          )),
    );
  }
}

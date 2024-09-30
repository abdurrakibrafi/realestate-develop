import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/utils/app_constant.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/viewModel/controllers/favoriteControllers/favorite_page_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/models/favoriteModels/favorite_model.dart';

import '../../../viewModel/controllers/addResidenceControllers/add_residence_controller.dart';
import '../propertyDetailsScreens/property_details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoritePageController controller =
  Get.put(FavoritePageController(""), permanent: false);
  String categoryId = "";
  final AddResidenceController addResidenceController = Get.put(AddResidenceController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (LocalStorage.getData(key: AppConstant.token) == null) {
        Get.off(() => SigninPage(), transition: Transition.fade);
      }else{

      }
    });
    Get.delete<FavoritePageController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText("Favorite".tr, size: 20, isBold: true),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: TextField(
                            onTap: () {},
                            enabled: true,
                            controller: controller.searchController.value,
                            onChanged: (value) =>
                                controller.searchFavorites(value),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(2.0),
                              hintText: "Search".tr,
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
                  // const SizedBox(
                  //   width: 5,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(12.0),
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: AppColor.blackColor,
                  //   ),
                  //   child: const ImageIcon(
                  //     color: AppColor.whiteColor,
                  //     AssetImage("assets/icons/menu.png"),
                  //     size: 24.0,
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            addResidenceController.catNameList.isNotEmpty ?  SizedBox(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                    itemCount: addResidenceController.catNameList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: () {
                          print(addResidenceController.catNameList[index].toString());
                          controller.selectItem(addResidenceController.catNameList[index].toString(), );
                        //  controller.searchFavoritesByCetagory(item.id.toString());

                        },
                        child: buildItem(
                            addResidenceController.catNameList[index].toString(),
                            addResidenceController.catIdList[index].toString()
                        ),
                      );
                    }
                ),
              ),
            ) : SizedBox.shrink(),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child:
                          commonText("Favorite".tr, size: 20, isBold: true),
                        ),
                      ],
                    ),
                    Column(children: [
                      Obx(() {
                        if (controller.isLoading.isTrue) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return (controller.filteredDataList.isEmpty)
                            ? emptyListView()
                            : ListView.builder(
                            itemCount: controller.filteredDataList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              AllFavoriteItems data =
                              controller.filteredDataList[index];
                              return justListedDesign(data);
                            });
                      }),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildItem(String item, String id) {
    return GestureDetector(
      onTap: () {
        controller.selectItem(item);

         controller.searchFavoritesByCetagory(id);
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
        child: commonText(
          item.tr,
          isBold: true,
          color: item == controller.selectedItem.value
              ? Colors.white
              : Colors.black,
        ),
      )),
    );
  }

  Widget justListedDesign(AllFavoriteItems data) {
    return GestureDetector(
      onTap: (){
    /*    Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ItemDetails(
                isHost: false,
                data: data,
              )),
        );*/
      },
      child: Column(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            height: 80, // Adjust as needed
                            width: 90, // Adjust as needed

                            data.residence!.images!.isNotEmpty
                                ? data.residence!.images?.first.url ??
                                DummyImage.networkImage
                                : DummyImage.networkImage,
                            fit: BoxFit.cover,
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
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: commonText(
                                      data.residence!.propertyName!,
                                      size: 14,
                                      isBold: true,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColor.primaryColor,
                                        size: 16,
                                      ),
                                      commonText(data.avgRating!.averageRating
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ImageIcon(
                                    AssetImage("assets/icons/locationIcon.png"),
                                    color: AppColor.blackColor,
                                  ),
                                  Expanded(
                                    child: commonText(
                                      data.residence!.address!.area!,
                                      color: AppColor.darkGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      commonText(
                                        data.residence!.rent.toString(),
                                        isBold: true,
                                        size: 12,
                                      ),
                                      commonText(
                                        ' K.D /Month'.tr,
                                        isBold: true,
                                        size: 12,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

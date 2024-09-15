import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/viewModel/controllers/homeControllers/home_page_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/view/common/notificationsScreens/notification_page.dart';
import 'package:real_estate_management/view/common/profileScreens/profile_page.dart';
import 'package:real_estate_management/view/guest/homePageScreens/search_page.dart';
import 'package:real_estate_management/view/host/homePageScreens/drawer_page.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';
import '../../../models/residencesModels/residences_model.dart';
import '../../../res/components/layoutManagement/no_data_layout.dart';
import '../../../viewModel/controllers/ResidencesControllers/residences_controller.dart';
import '../../../viewModel/controllers/addResidenceControllers/add_residence_controller.dart';
import '../../../viewModel/controllers/homeControllers/filter_controller.dart';
import '../../../viewModel/controllers/profileControllers/profile_controller.dart';
import '../../../viewModel/controllers/user_preference/user_preference_view_model.dart';
import '../../host/addResidenceScreens/v2/add_residence_page.dart';
import '../../host/myResidenceScreens/my_residence_page.dart';
import '../propertyDetailsScreens/all_property_screen.dart';
import '../propertyDetailsScreens/property_details_page.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({super.key});

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomePageController controller = Get.put(HomePageController());
  final AddResidenceController addResidenceController = Get.put(AddResidenceController());
  final ProfileController profileController =
  Get.put(ProfileController(), permanent: false);
  final ResidencesController residencesController =
  Get.put(ResidencesController(), permanent: false);
  UserPreference preference = UserPreference();
  TextEditingController searchController = TextEditingController();
  String categoryId = "";


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: ()async {
          await  profileController.fetchData();
          await residencesController.fetchData();
          await addResidenceController.getCategory();
         print("${await preference.getUser()}");

        },
        child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            key: _scaffoldKey,
            // endDrawer: customDrawer(context),
            drawer: customStartDrawer(context, ""),
            appBar: AppBar(
              backgroundColor: Color(0xff263238),
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const ProfilePage(isHost: false, isGuest: true)),
                      );
                    },
                    child:   ClipOval(
                      child: profileController.profileData.value?.image == null?
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColor.whiteColor,width: 2),
                              color: AppColor.primaryColor
                            ),
                            child: Obx(() => Center(
                              child: Text(
                                profileController.profileData.value?.name?.substring(0, 1).toUpperCase() ?? '',
                                style: TextStyle(color: AppColor.whiteColor),
                                softWrap: true,  // Enable text wrapping
                              ),
                            )),
                          )
                          : Image.network(
                        profileController.profileData.value!.image.toString(),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,

                      ),
                    ),
                  ),
                  SizedBox(width: 05,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Welcome Back!".tr, size: 12, isBold: false,color: Colors.white),
                      Obx(() {
                        return commonText("${profileController.profileData.value?.name ?? ""}", size: 14, isBold: false,color: Colors.white);
                      }),
                    ],
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColor.blackColor,
                    child: ImageIcon(
                      color: AppColor.whiteColor,
                      AssetImage(
                        'assets/icons/Notification.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Obx(() =>  profileController.profileData.value?.role == "landlord" ?    GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddResidencePage(isEdit: false,)),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColor.blackColor,
                    child: Icon(
                      Icons.add,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ):SizedBox(),),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                        color: Color(0xff263238),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            commonText("Let's Begin The Search For".tr,
                                color: AppColor.whiteColor,
                                isBold: true,
                                size: 20),
                            commonText("The".tr,
                                color: AppColor.primaryColor,
                                size: 20,
                                isBold: true),
                          ],
                        ),
                        commonText("Perfect Property".tr,
                            color: AppColor.primaryColor, size: 20, isBold: true),
                        const SizedBox(
                          height: 10,
                        ),
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
                                      color: AppColor.searchBlack,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: TextField(
                                      onTap: () {},
                                      enabled: false,
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(2.0),
                                        hintText: "Search".tr,
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColor.darkGreyColor,
                                        ),
                                        border: InputBorder.none,
                                        prefixIcon:  Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset("assets/icons/common/search-normal.png"),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _scaffoldKey.currentState!.openDrawer();
                                });
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.searchBlack),
                                    child: const ImageIcon(
                                      color: AppColor.whiteColor,
                                      AssetImage("assets/icons/common/more.png"),
                                      size: 24.0,
                                    ),
                                  ),
                                  Positioned(
                                      top: 8,
                                      right: 8,
                                      child: CircleAvatar(radius: 6,backgroundColor: AppColor.primaryColor,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                   Obx(() =>    addResidenceController.catNameList.isNotEmpty ?  SizedBox(
                     height: 35,
                     child: ListView.builder(
                         itemCount: addResidenceController.catNameList.length,
                         shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context,index){
                           //  var item = addResidenceController.categoryList[index];
                           return GestureDetector(
                             onTap: () {
                               controller.selectItem(addResidenceController.catNameList[index].toString());
                               residencesController.fetchData(category: addResidenceController.catIdList[index].toString());
                             },
                             child: buildItem(
                               addResidenceController.catNameList[index].toString(),
                             ),
                           );
                         }
                     ),
                   ) : SizedBox.shrink(),),
                  SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonText("Top Picks".tr, isBold: true, size: 16),
                          GestureDetector(
                              onTap: () {
                                Get.delete<ResidencesController>();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllPropertyScreen(residencesDataList: residencesController.residencesDataList,)),
                                );
                              },
                              child: commonText("See all".tr,
                                  color: AppColor.primaryColor))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),


                      SizedBox(
                        height: 265,
                        child: Obx(() {
                          if (residencesController.isLoading.isTrue) {
                            return ListView.builder(
                              itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(right: 8.0),
                                      child: SizedBox(
                                        width: 300,
                                        child: Card(
                                          color: AppColor.whiteColor,
                                          elevation: 4,
                                          surfaceTintColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            );
                          }
                          return (residencesController.residencesDataList.isEmpty)
                              ? emptyListView()
                              : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: residencesController
                                .residencesDataList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                          isHost: false,
                                          data: residencesController
                                              .residencesDataList[
                                          index],
                                        )),
                                  );
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: Card(
                                      color: AppColor.whiteColor,
                                      elevation: 4,
                                      surfaceTintColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          12)),
                                                  child: Image.network(
                                                      height: 150,
                                                      residencesController.residencesDataList[index].images!.isNotEmpty
                                                          ? residencesController
                                                          .residencesDataList[
                                                      index]
                                                          .images
                                                          ?.first
                                                          .url ??
                                                          DummyImage
                                                              .networkImage
                                                          : DummyImage
                                                          .networkImage,
                                                      fit: BoxFit.cover,
                                                      width: double.infinity,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                          Object exception,
                                                          StackTrace? stackTrace) {
                                                        return Image.network(
                                                          DummyImage
                                                              .networkImage,
                                                          fit: BoxFit.cover,
                                                          width:
                                                          double.infinity,
                                                        );
                                                      })),
                                              // Positioned(
                                              //   right: 10,
                                              //   top: 10,
                                              //   child: Container(
                                              //       padding:
                                              //           const EdgeInsets
                                              //               .all(5.0),
                                              //       decoration:
                                              //           BoxDecoration(
                                              //         color: AppColor
                                              //             .primaryColorLight,
                                              //         borderRadius:
                                              //             BorderRadius
                                              //                 .circular(
                                              //                     50.0),
                                              //       ),
                                              //       child: const Icon(
                                              //         Icons.favorite,
                                              //         color: Colors.red,
                                              //       )),
                                              // )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: commonText(
                                                          residencesController
                                                              .residencesDataList[
                                                          index]
                                                              .propertyName ??
                                                              "N/A",
                                                          size: 14,
                                                          maxLines: 1,
                                                          isBold: true),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: AppColor
                                                                .primaryColor,
                                                            size: 20,
                                                          ),
                                                          commonText(
                                                            residencesController
                                                                .residencesDataList[
                                                            index]
                                                                .averageRating
                                                                .toString(),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                commonText(
                                                    residencesController
                                                        .residencesDataList[
                                                    index]
                                                        .address!
                                                        .area ??
                                                        "N/A",
                                                    color: Colors.grey),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    commonText(
                                                        residencesController
                                                            .residencesDataList[
                                                        index]
                                                            .rent
                                                            .toString(),
                                                        size: 14,
                                                        color: AppColor
                                                            .primaryColor),
                                                    commonText(
                                                        ' K.D /Month'.tr,
                                                        size: 14,
                                                        color: Colors.grey),
                                                  ],
                                                ),
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
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonText("Just Listed".tr, isBold: true, size: 16),
                          GestureDetector(
                              onTap: () {
                                Get.delete<ResidencesController>();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       AllPropertyScreen(residencesDataList: residencesController.residencesDataList,)),
                                );
                              },
                              child: commonText("See all".tr,
                                  color: AppColor.primaryColor))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (residencesController.isLoading.isTrue) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return (residencesController.residencesDataList.isEmpty)
                            ? emptyListView()
                            : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: residencesController
                              .residencesDataList.length,
                          itemBuilder: (context, index) {
                            AllResidence data = residencesController
                                .residencesDataList[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                          isHost: false,
                                          data: residencesController
                                              .residencesDataList[
                                          index],
                                        )),
                                  );
                                },
                                child: justListedDesign(data));
                          },
                        );
                      })
                    ],
                  ),
                )
                ],
              ),
            )),
      ),
    );
  }



  Widget buildItem(String item, {String? path}) {
    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: item == controller.selectedItem.value
            ? AppColor.primaryColor
            : const Color(0xffff2f2f3),
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
    ));
  }

  Widget justListedDesign(AllResidence data) {
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
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          height: 80, // Adjust as needed
                          width: 90, // Adjust as needed

                          data.images!.isNotEmpty
                              ? data.images?.first.url ??
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
                                    data.propertyName ?? "N/A",
                                    size: 14,
                                    maxLines: 2,
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
                                    commonText(data.averageRating.toString()),
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
                                    data.address!.area ?? "N/A",
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
                                      '${data.rent}',
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
    );
  }

  Widget customBox(PropertyType property) {
    return Obx(() => GestureDetector(
      onTap: () {
        Get.find<FilterController>().togglePropertySelection(property);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: property.isSelected.value
                ? AppColor.primaryColor
                : AppColor.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
          color: property.isSelected.value
              ? AppColor.primaryColor
              : AppColor.whiteColor,
        ),
        child: commonText(
          property.name.tr,
          size: 12,
          color: property.isSelected.value
              ? AppColor.whiteColor
              : AppColor.primaryColor,
        ),
      ),
    ));
  }
}

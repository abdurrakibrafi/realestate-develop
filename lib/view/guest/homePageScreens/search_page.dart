import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/view/guest/homePageScreens/property_item_design.dart';
import 'package:real_estate_management/view/guest/propertyDetailsScreens/property_details_page.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';
import 'package:real_estate_management/viewModel/controllers/homeControllers/filter_controller.dart';
import 'package:real_estate_management/viewModel/controllers/homeControllers/search_page_controller.dart';

class SearchPage extends StatefulWidget {
  final bool isForFilter;
  const SearchPage({super.key, this.isForFilter = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  final FilterController controller =
      Get.put(FilterController(), permanent: false);
  final SearchPageController residencesController =
      Get.put(SearchPageController(), permanent: false);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isForFilter) {
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.whiteColor,
      endDrawer: customDrawer(context, onTap: () {
        residencesController.fetchData(
            category: controller.selectedPropertyId ?? "",
            budget:
                '${controller.budgetRange.value.start}-${controller.budgetRange.value.end}',
            rooms: controller.selectedRooms.value == 0
                ? ""
                : controller.selectedRooms.value.toString(),
            rentingType: controller.duration.value,
            residenceType: controller.residence.value,
            features: controller.features
                .where((f) => f.isSelected.value)
                .map((f) => f.name)
                .join(','),
            governorate: controller.governorate.value);
        Navigator.pop(context);
      }, onResetTap: () {
        residencesController.fetchData(
            category: "",
            budget: "",
            rooms: "",
            rentingType: "",
            residenceType: "",
            features: "",
            governorate: "");
      }
          // onResetTap: () {
          //   for (var property in controller.propertyTypes) {
          //     property.isSelected.value = false;
          //   }

          //   controller.budgetRange.value = const RangeValues(0, 100);
          //   controller.selectedRooms.value = 0;

          //   controller.duration.value = "";
          //   controller.residence.value = "";
          //   controller.features.clear();
          //   controller.governorate.value = "";
          //   residencesController.fetchData(
          //       category: "",
          //       budget: "",
          //       rooms: "",
          //       rentingType: "",
          //       residenceType: "",
          //       features: "",
          //       governorate: "");
          //   Navigator.pop(context);
          // },
          ),
      appBar: AppBar(
        title: commonText("Search".tr, size: 15),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: commonTextfield(
                    residencesController.searchController,
                    hintText: "Search for a Property".tr,
                    assetIconPath: "assets/icons/searchIcon.png",
                    onChanged: (value) {
                      setState(() {
                        residencesController.fetchData();
                      });
                    },
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
                    ),
                    child: const ImageIcon(
                      color: AppColor.blackColor,
                      AssetImage("assets/icons/filterIcon2.png"),
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(() {
                if (residencesController.isLoading.isTrue) {
                  return const Center(child: CircularProgressIndicator());
                }
                return (residencesController.residencesDataList.isEmpty)
                    ? emptyListView()
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: 0.95,
                        ),
                        itemCount:
                            residencesController.residencesDataList.length,
                        itemBuilder: (context, index) {
                          if (index <
                              residencesController.residencesDataList.length) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetails(
                                            isHost: false,
                                            data: residencesController
                                                .residencesDataList[index],
                                          )),
                                );
                              },
                              child: itemDesign(residencesController
                                  .residencesDataList[index]),
                            );
                          } else {
                            return const SizedBox
                                .shrink(); // Return an empty widget for out-of-range indices
                          }
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDrawer(BuildContext context,
      {VoidCallback? onTap, Function? onResetTap}) {
    // final FilterController controller = Get.put(FilterController());

    return Drawer(
      backgroundColor: AppColor.whiteColor,
      surfaceTintColor: Colors.transparent,
      elevation: 16.0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Type
              commonText("Property Type".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: controller.propertyTypes
                        .where((type) => !type.isDeleted)
                        .map((type) => customBox(type))
                        .toList(),
                  )),
              const SizedBox(height: 20),

              // Budget
              commonText("Budget".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => RangeSlider(
                    values: controller.budgetRange.value,
                    min: 0,
                    max: 100000,
                    divisions: 100000,
                    labels: RangeLabels(
                      '${controller.budgetRange.value.start.toStringAsFixed(1)} K.D',
                      '${controller.budgetRange.value.end.toStringAsFixed(1)} K.D',
                    ),
                    onChanged: (RangeValues values) {
                      controller.budgetRange.value = values;
                    },
                    activeColor: AppColor.primaryColor,
                    inactiveColor: Colors
                        .grey[300], // Adjust the color to match your theme
                  )),
              const SizedBox(height: 20),

              // Rooms
              commonText("Rooms".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [1, 2, 3, 4, 5, 6]
                        .map((room) => customRoomBox(
                            room, controller.selectedRooms.value == room))
                        .toList(),
                  )),
              const SizedBox(height: 20),

              // Duration of Stay
              commonText("Renting Type".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: ['Short Term'.tr, 'Long Term'.tr]
                        .map((dur) => customDurationBox(
                            dur, controller.duration.value == dur))
                        .toList(),
                  )),
              const SizedBox(height: 20),

              // Residence
              commonText("Residence".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: ['Private Residence', 'Condominium']
                        .map((res) => customResidenceBox(
                            res, controller.residence.value == res))
                        .toList(),
                  )),
              const SizedBox(height: 20),

              // Features
              commonText("Features".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: controller.features
                        .where((feature) => !feature.isDeleted)
                        .map((feature) => customBox(feature, isFeature: true))
                        .toList(),
                  )),
              const SizedBox(height: 20),

              // Governorate
              commonText("Governorate".tr, size: 16, isBold: true),
              const Divider(),
              Obx(() => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      'Kuwait City',
                      'Hawalli',
                      'Farwaniya',
                      'Ahmadi',
                      'Jahra'
                    ]
                        .map((gov) => customGovernorateBox(
                            gov, controller.governorate.value == gov))
                        .toList(),
                  )),
              const SizedBox(height: 15),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          for (var property in controller.propertyTypes) {
                            property.isSelected.value = false;
                          }

                          controller.budgetRange.value =
                              const RangeValues(0, 100000);
                          controller.selectedRooms.value = 0;

                          controller.duration.value = "";
                          controller.residence.value = "";
                          controller.features.clear();
                          controller.governorate.value = "";
                          onResetTap!();
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColor.primaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.replay_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  commonText("Reset all".tr,
                                      isBold: true,
                                      color: AppColor.primaryColor),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: AppColor.primaryColor,
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: commonText("Apply".tr,
                                  isBold: true, color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customBox(PropertyType property, {bool isFeature = false}) {
    return Obx(() => GestureDetector(
          onTap: () {
            if (isFeature) {
              Get.find<FilterController>().toggleFeatureSelection(property);
            } else {
              Get.find<FilterController>().togglePropertySelection(property);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: property.isSelected.value
                  ? Colors.amber.shade50
                  : const Color(0xFFF2F2F3),
            ),
            child: commonText(
              property.name.tr,
              size: 12,
              color: property.isSelected.value
                  ? AppColor.primaryColor
                  : Colors.grey,
            ),
          ),
        ));
  }

  Widget customRoomBox(int room, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<FilterController>().selectedRooms.value = room;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
        ),
        child: commonText(
          room.toString().padLeft(2, '0'),
          size: 12,
          color: isSelected ? AppColor.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget customDurationBox(String duration, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<FilterController>().duration.value = duration;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
        ),
        child: commonText(
          duration,
          size: 12,
          color: isSelected ? AppColor.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget customResidenceBox(String residence, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<FilterController>().residence.value = residence;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
        ),
        child: commonText(
          residence,
          size: 12,
          color: isSelected ? AppColor.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget customApartmentTypeBox(String type, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<FilterController>().apartmentType.value = type;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
        ),
        child: commonText(
          type,
          size: 12,
          color: isSelected ? AppColor.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget customGovernorateBox(String gov, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<FilterController>().governorate.value = gov;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
        ),
        child: commonText(
          gov,
          size: 12,
          color: isSelected ? AppColor.primaryColor : Colors.grey,
        ),
      ),
    );
  }
}

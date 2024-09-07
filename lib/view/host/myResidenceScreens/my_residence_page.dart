import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/guest/propertyDetailsScreens/property_details_page.dart';
import 'package:real_estate_management/view/host/myResidenceScreens/my_residence_item_design.dart';
import 'package:real_estate_management/viewModel/controllers/ResidencesControllers/my_listing_controller.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

import '../../../res/components/layoutManagement/no_data_layout.dart';

class MyResidencePage extends StatefulWidget {
  const MyResidencePage({super.key});

  @override
  State<MyResidencePage> createState() => _MyResidencePageState();
}

class _MyResidencePageState extends State<MyResidencePage> {
  final MyListingController residencesController =
      Get.put(MyListingController(), permanent: true);
  UserPreference preference = UserPreference();
  String host = "";

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    host = await preference.getId();
    log(host);
    residencesController.fetchData(host: host);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load more data when the user scrolls to the end
        residencesController.loadMoreData();
      }
    });
  }

  void getId() async {
    host = await preference.getId();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("My Properties".tr, size: 15),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return residencesController.isLoading.value? Center(child: CircularProgressIndicator(),): residencesController.residencesDataList.isEmpty? emptyListView() : GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: residencesController.residencesDataList.length +
                      (residencesController.isMoreDataAvailable.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index ==
                        residencesController.residencesDataList.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    AllResidence data =
                        residencesController.residencesDataList[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemDetails(
                                      isHost: true,
                                      data: data,
                                    )),
                          );
                        },
                        child: myResidenceitemDesign(data));
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

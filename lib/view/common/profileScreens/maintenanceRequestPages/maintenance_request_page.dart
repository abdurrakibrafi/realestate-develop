import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:real_estate_management/models/maintenanceRequestModel/maintenance_request_model.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/view/common/profileScreens/maintenanceRequestPages/maintenance_form_page.dart';
import 'package:real_estate_management/viewModel/controllers/maintenanceRequestControllers/maintenance_request_controller.dart';

class MaintenanceRequestPage extends StatefulWidget {
  const MaintenanceRequestPage({super.key});

  @override
  State<MaintenanceRequestPage> createState() => _MaintenanceRequestPageState();
}

class _MaintenanceRequestPageState extends State<MaintenanceRequestPage>  with SingleTickerProviderStateMixin  {
  final MaintenanceRequestController maintenanceRequestController =
      Get.put(MaintenanceRequestController(), permanent: true);
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText("Maintenance Request".tr,
              size: 16, isBold: true, color: AppColor.darkGreyColor),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
      body: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: AppColor.primaryColor,
            indicatorColor: AppColor.primaryColor,
            tabs: [
              Tab(
                child: commonText('Pending'.tr),
              ),
              Tab(
                child: commonText(
                  'Ongoing'.tr,
                ),
              ),
              Tab(
                child: commonText(
                  'Closed'.tr,
                ),
              ),
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: Obx(() {
              if (maintenanceRequestController.isLoading.value == true) {
                return const Center(child: CircularProgressIndicator());
              }
              return RefreshIndicator(
                onRefresh: () async{
                  await maintenanceRequestController.maintenaceRequest();
                },
                child: TabBarView(
                  controller: tabController,
                  children: [pendingTab(),onGoingTab() ,onCloseTab()],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
  Widget pendingTab() {
    return (maintenanceRequestController.maintenanceList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: ()async {
            await maintenanceRequestController.maintenaceRequest();
          },
          child: ListView.builder(
          itemCount: maintenanceRequestController.maintenanceList.length,
          itemBuilder: (context, index) {
            var data =
            maintenanceRequestController.maintenanceList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(MaintenanceFormPage(
                    data: data, isPending: true,
                  ));
                },
                child: Card(
                  color: AppColor.primaryColor,
                  surfaceTintColor: Colors.transparent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: material.Image.network(
                            DummyImage.networkImage,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              commonText(
                                data.property?.propertyName ?? "",
                                size: 16,
                                maxLines: 2,
                                isBold: true,
                                color: AppColor.whiteColor,
                              ),
                              commonText(
                                data.property?.address?.area ?? "",
                                color: AppColor.whiteColor,
                              ),
                              commonText('Tuesday, 08:25 am',
                                  color: AppColor.whiteColor, size: 14),
                              commonText(
                                'Maintenance request with Elvin L. Dean',
                                color: AppColor.whiteColor,
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
          }),
        );
  }
  Widget onGoingTab() {
    return (maintenanceRequestController.maintenanceAcceptedList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: ()async {
            await maintenanceRequestController.maintenaceRequest();
          },
          child: ListView.builder(
          itemCount: maintenanceRequestController.maintenanceAcceptedList.length,
          itemBuilder: (context, index) {
            var data =
            maintenanceRequestController.maintenanceAcceptedList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(MaintenanceFormPage(
                    data: data, isPending: false,
                  ));
                },
                child: Card(
                  color: AppColor.primaryColor,
                  surfaceTintColor: Colors.transparent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: material.Image.network(
                            DummyImage.networkImage,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              commonText(
                                data.property?.propertyName ?? "",
                                size: 16,
                                isBold: true,
                                maxLines: 2,
                                color: AppColor.whiteColor,
                              ),
                              commonText(
                                data.property?.address?.area ?? "",
                                color: AppColor.whiteColor,
                              ),
                              commonText('Tuesday, 08:25 am',
                                  color: AppColor.whiteColor, size: 14),
                              commonText(
                                'Maintenance request with Elvin L. Dean',
                                color: AppColor.whiteColor,
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
          }),
        );
  }
  Widget onCloseTab() {
    return (maintenanceRequestController.maintenanceCloseList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: ()async {
            await maintenanceRequestController.maintenaceRequest();
          },
          child: ListView.builder(
          itemCount: maintenanceRequestController.maintenanceCloseList.length,
          itemBuilder: (context, index) {
            var data =
            maintenanceRequestController.maintenanceCloseList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(MaintenanceFormPage(
                    data: data, isPending: false,
                  ));
                },
                child: Card(
                  color: AppColor.primaryColor,
                  surfaceTintColor: Colors.transparent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: material.Image.network(
                            DummyImage.networkImage,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              commonText(
                                data.property?.propertyName ?? "",
                                size: 16,
                                maxLines: 2,
                                isBold: true,
                                color: AppColor.whiteColor,
                              ),
                              commonText(
                                data.property?.address?.area ?? "",
                                color: AppColor.whiteColor,
                              ),
                              commonText('Tuesday, 08:25 am',
                                  color: AppColor.whiteColor, size: 14),
                              commonText(
                                'Maintenance request with Elvin L. Dean',
                                color: AppColor.whiteColor,
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
          }),
        );
  }
}

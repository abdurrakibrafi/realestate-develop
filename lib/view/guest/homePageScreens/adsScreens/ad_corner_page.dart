// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/controller/ads_controller/ads_controller.dart';
import 'package:real_estate_management/models/adsModels/single_category_model.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsCornerPage extends StatefulWidget {
  const AdsCornerPage({super.key});

  @override
  State<AdsCornerPage> createState() => _AdsCornerPageState();
}

class _AdsCornerPageState extends State<AdsCornerPage> {
  final AdsCategoryController categoryController =
      Get.put(AdsCategoryController());
  TextEditingController searchController = TextEditingController();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data when scrolled to the bottom
      categoryController.loadMoreAds(categoryController.selectedItem.value);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("All You Need".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              /// Categories
              Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: categoryController.categoryList.map((item) {
                        return buildItem(item["name"] ?? "", item["id"] ?? "");
                      }).toList(),
                    ),
                  ),
                );
              }),

              Expanded(
                child: Obx(() {
                  if (categoryController.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return (categoryController.adsDataList.isEmpty)
                      ? emptyListView()
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: categoryController.adsDataList.length + 1,
                          itemBuilder: (context, index) {
                            if (index ==
                                categoryController.adsDataList.length) {
                              return categoryController.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : const SizedBox.shrink();
                            }
                            var ad = categoryController.adsDataList[index];
                            return GestureDetector(
                              onTap: () {
                                _launchUrl(ad.contactLink.toString());
                              },
                              child: adsItemDesign(ad),
                            );
                          },
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget adsItemDesign(SingleCat ad) {
    return Column(
      children: [
        Card(
          color: AppColor.whiteColor,
          elevation: 4,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: SizedBox(
                    height: 150,
                    child: Image.network(
                      ad.banner ?? DummyImage.networkImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: commonButton("Contact Now".tr, onTap: () {
                    _launchUrl(ad.contactLink.toString());
                  }),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget buildItem(String item, String categoryId, {String? path}) {
    return GestureDetector(
      onTap: () {
        categoryController.selectItem(item, categoryId);
      },
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: item == categoryController.selectedItem.value
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
                    color: item == categoryController.selectedItem.value
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
                  color: item == categoryController.selectedItem.value
                      ? Colors.white
                      : Colors.black,
                ),
              ],
            ),
          )),
    );
  }
}

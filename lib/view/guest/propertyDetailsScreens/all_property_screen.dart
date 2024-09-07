import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/view/guest/propertyDetailsScreens/property_details_page.dart';

import '../../../models/residencesModels/residences_model.dart';
import '../../../res/assets/images.dart';
import '../../../res/colors/colors.dart';
import '../../../viewModel/controllers/ResidencesControllers/residences_controller.dart';

class AllPropertyScreen extends StatelessWidget {
    final List<AllResidence> residencesDataList;
   AllPropertyScreen({super.key, required this.residencesDataList,});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: commonText("Property".tr,isBold: true),centerTitle: true,),
      body: residencesDataList.isEmpty? emptyListView()  : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in a row
            childAspectRatio: 1.0, // Aspect ratio of the items
            crossAxisSpacing: 2.0, // Spacing between columns
            mainAxisSpacing: 2.0, // Spacing between rows
          ),
          itemCount: residencesDataList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        isHost: false,
                        data: residencesDataList[
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
                                    height: 80,
                                    residencesDataList[index].images!.isNotEmpty
                                        ? residencesDataList[
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
                                            residencesDataList[
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

                                              residencesDataList[
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

                                      residencesDataList[
                                  index]
                                      .address!
                                      .area ??
                                      "N/A",
                                  color: Colors.grey),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  commonText(

                                          residencesDataList[
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
        ),
      ),
    );
  }
}

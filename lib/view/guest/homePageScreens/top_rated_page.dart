import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/guest/homePageScreens/property_item_design.dart';
import 'package:real_estate_management/viewModel/controllers/ResidencesControllers/residences_controller.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  final ResidencesController residencesController =
      Get.put(ResidencesController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Top Rated", size: 15),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 0.95,
            ),
            itemCount: 25,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: itemDesign(
                      residencesController.residencesDataList[index]));
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/view/guest/homePageScreens/property_item_design.dart';
import 'package:real_estate_management/viewModel/controllers/ResidencesControllers/residences_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  final ResidencesController residencesController =
      Get.put(ResidencesController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Search", size: 15),
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
                    searchController,
                    hintText: "Search for a residence",
                    assetIconPath: "assets/icons/searchIcon.png",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: const ImageIcon(
                    AssetImage("assets/icons/filterIcon.png"),
                    size: 24.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 0.95,
                ),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return itemDesign(
                      residencesController.residencesDataList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

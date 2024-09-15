import 'dart:developer';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_management/controller/chat/all_friend_controller.dart';
import 'package:real_estate_management/models/residencesModels/add_residence_model.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/repository/residences_repository/add_residence_repository.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/service/local_storage.dart';

import 'package:real_estate_management/view/common/messagesScreens/message_page.dart';
import 'package:real_estate_management/view/guest/propertyDetailsScreens/property_map_location_page.dart';

import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import 'package:real_estate_management/view/guest/propertyDetailsScreens/details_map.dart';

import 'package:real_estate_management/view/guest/schedulingScreens/scheduling_page.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/add_residence_page.dart';
import 'package:real_estate_management/viewModel/controllers/favoriteControllers/favorite_page_controller.dart';
import 'package:real_estate_management/viewModel/controllers/ratingController/rating_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../viewModel/controllers/ResidencesControllers/residences_controller.dart';
import '../../../viewModel/controllers/profileControllers/profile_controller.dart';
import '../guest_root_screen.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

enum SampleItem { itemOne, itemTwo }

class ItemDetails extends StatefulWidget {
  final bool isHost;
  final AllResidence data;

  const ItemDetails({super.key, required this.isHost, required this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  UserPreference userPreference = UserPreference();
  AddResidencesRepository api = AddResidencesRepository();
  final FriendController friendController = Get.put(FriendController());
  final ResidencesController residencesController =
  Get.put(ResidencesController(), permanent: false);

  final ProfileController profileController =
  Get.put(ProfileController(), permanent: false);


  String id = "";
  String role = "";


  void getId() async {
    id = await userPreference.getId();
  }
  void getRole() async {
    role = await userPreference.getRole();
  }

  SampleItem? selectedItem;
  int _selectedIndex = 0;
  RxInt imageIndex = 0.obs;

  @override
  void initState() {
    getId();
    getRole();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final FavoritePageController controller =
        Get.put(FavoritePageController(widget.data.sId!), permanent: false);

    return WillPopScope(
      onWillPop: () async {
        Get.delete<FavoritePageController>();
        return true;
      },
      child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 350,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              PageView.builder(
                                itemCount: widget.data.images?.length,
                                itemBuilder: (context, index) {
                                  // Defer state update to the next frame
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    imageIndex.value = index;
                                  });

                                  return ClipRRect(
                                    child: Image.network(
                                      widget.data.images![index].url!,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                top: 30,
                                left: 27,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.delete<FavoritePageController>();
                                    Navigator.pop(context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: AppColor.whiteColor,
                                    child: Icon(Icons.arrow_back_ios_rounded),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  height: 28,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Obx(() => Center(
                                    child: Text(
                                      "${imageIndex.value + 1}/${widget.data.images?.length}",
                                      style: TextStyle(
                                        color: AppColor.whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                              profileController.profileData.value!.role! == "user"
                                  ?  Positioned(
                                top: 30,
                                right: 28,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Obx(() {
                                    return GestureDetector(
                                      onTap: () => controller.addData(),
                                      child: Icon(
                                        controller.isFavorite.value
                                            ? FontAwesomeIcons.solidHeart
                                            : FontAwesomeIcons.heart,
                                        color: AppColor.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              )
                                  : const SizedBox()
                            ],
                          ),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: commonText(
                                              widget.data.propertyName ??
                                                  'N/A',
                                              size: 14,
                                              isBold: true),
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.star, color: Colors.orange),
                                                commonText(
                                                    widget.data.averageRating.toString(),
                                                    color: Colors.grey),
                                                commonText(
                                                    "(${widget.data.totalReview} ${"Reviews".tr})",
                                                    color: Colors.grey)
                                              ],
                                            ),
                                            Visibility(
                                              visible:
                                               widget.data.host!.sId == LocalStorage.getData(key: "userId"),
                                              child:
                                                  PopupMenuButton<SampleItem>(
                                                color: Colors.white,
                                                surfaceTintColor:
                                                    Colors.transparent,
                                                initialValue: selectedItem,
                                                onSelected:
                                                    (SampleItem item) {
                                                  setState(() {
                                                    selectedItem = item;
                                                  });
                                                  switch (item) {
                                                    case SampleItem.itemOne:
                                                      Get.to(AddResidencePage(
                                                          isEdit: true,
                                                          data: widget.data));
                                                      break;
                                                    case SampleItem.itemTwo:
                                                      _showDeleteDialog(
                                                          context);
                                                      break;
                                                  }
                                                },
                                                itemBuilder:
                                                    (BuildContext context) =>
                                                        <PopupMenuEntry<
                                                            SampleItem>>[
                                                  PopupMenuItem<SampleItem>(
                                                    value: SampleItem.itemOne,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Icon(
                                                          Icons.edit_document,
                                                          size: 16,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        commonText('Edit'.tr),
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem<SampleItem>(
                                                    value: SampleItem.itemTwo,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .delete_outline_rounded,
                                                          size: 16,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        commonText(
                                                            'Delete'.tr),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: () =>
                                            Get.to(() => PropertyMapScreen(
                                                  lat: double.parse(widget
                                                      .data.location!.latitude
                                                      .toString()),
                                                  lng: double.parse(widget
                                                      .data.location!.longitude
                                                      .toString()),
                                                )),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                           Row(
                                             children: [
                                               const CircleAvatar(
                                                 radius: 10,
                                                 backgroundColor:
                                                 AppColor.primaryColor,
                                                 child: FittedBox(
                                                   child: Padding(
                                                     padding: EdgeInsets.all(2.0),
                                                     child: Icon(
                                                       Icons.location_on_outlined,
                                                       color: AppColor.whiteColor,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                               const SizedBox(
                                                 width: 5,
                                               ),
                                               commonText(
                                                   widget.data.address?.area ??
                                                       'N/A',
                                                   size: 12,
                                                   color: AppColor.primaryColor),
                                               const SizedBox(
                                                 width: 5,
                                               ),
                                               commonText(
                                                   widget.data.address
                                                       ?.governorate ??
                                                       'N/A',
                                                   size: 12,
                                                   color: AppColor.primaryColor),
                                             ],
                                           ),
                                          /*  const SizedBox(
                                              width: 10,
                                            ),*/
                                            Image.asset(
                                                "assets/icons/export (2).png")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      /*  Container(
                          margin: const EdgeInsets.fromLTRB(28, 0, 34, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/icons/bed.png",
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  commonText('${widget.data.rentType}'.tr,
                                      size: 14, color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                        ),*/
                        profileController.profileData.value!.role! == "user"
                            ?  ListTile(
                          leading: Container(
                            margin:
                            const EdgeInsets.fromLTRB(0, 0, 10.1, 0),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: const Color(0xFFD9D9D9),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: widget.data.host?.image == null? NetworkImage(DummyImage.networkImage) : NetworkImage(
                                  widget.data.host!.image!,
                                ),
                              ),
                            ),
                          ),
                          title: commonText(
                              widget.data.host?.name ?? 'N/A',
                              size: 16,
                              isBold: true),
                          subtitle: commonText(
                              widget.data.host?.role ?? 'N/A',
                              size: 14,
                              color: Colors.grey),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  friendController.createChat(
                                      senderId: id,

                                      receiverId:
                                      "${widget.data.host?.sId}");
                                   //Get.to(() => const GuestRootScreen(indexValue: 2,));
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      0, 0, 10.1, 0),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color: Colors.amber.shade100),
                                  child: Image.asset(
                                    "assets/icons/chatIcon.png",
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _makePhoneCall(
                                      number:
                                      "${widget.data.host?.phoneNumber}");
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      0, 0, 10.1, 0),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color: Colors.amber.shade100),
                                  child: const Icon(
                                    Icons.call,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                            : SizedBox(),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Row(
                            children: [
                              commonText("Features".tr, size: 16, isBold: true)
                            ],
                          ),
                        ),
                     /*   const SizedBox(
                          height: 10,
                        ),*/
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 35,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.data.features!.length,
                                      itemBuilder: (context, index) {
                                        return buildItem(
                                            widget.data.features![index].tr,
                                            path: "assets/icons/feature.png");
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),

                        TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: AppColor.primaryColor,
                          indicatorColor: AppColor.primaryColor,
                          tabs: [
                            Tab(
                              child: Text('Description'.tr),
                            ),
                            Tab(
                              child: Text('Gallery'.tr),
                            ),
                            Tab(
                              child: Text('Review'.tr),
                            ),
                          ],
                          controller: tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          onTap: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                        Visibility(
                          visible: _selectedIndex == 0,
                          child: descriptionTab(),
                        ),
                        Visibility(
                          visible: _selectedIndex == 1,
                          child: galleryTab(),
                        ),
                        Visibility(
                          visible: _selectedIndex == 2,
                          child: reviewTab(),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(28, 0, 29, 18),
                          color: Colors.amber.shade50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 55.5, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 1.5),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: commonText('Rent'.tr,
                                                  size: 14, isBold: true),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 1,
                                                color: Colors.grey,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${widget.data.rent} K.D/',
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    height: 1.3,
                                                    color: AppColor.blackColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${widget.data.paymentType}'
                                                          .tr,
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    height: 1.3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  profileController.profileData.value!.role! == "user"
                                      ?  Expanded(
                                    child: commonButton(
                                      height: 40,
                                      "Book Now".tr,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SchedulingPage(
                                                    residence:
                                                    widget.data.sId!,
                                                    propertyName: widget
                                                        .data
                                                        .propertyName!,
                                                    address: widget.data
                                                        .address!.area!,
                                                    rating: widget.data
                                                        .averageRating!
                                                        .toString(),
                                                    price: widget
                                                        .data.rent!
                                                        .toString(),
                                                    discount: widget
                                                        .data.discount!
                                                        .toString(),
                                                    discountCode:
                                                    "${widget.data.discountCode}",
                                                    image: widget.data
                                                        .images![0].url
                                                        .toString(),
                                                  )),
                                        );
                                      },
                                    ),
                                  )
                                      : SizedBox()
                                ],
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _makePhoneCall({required String number}) async {
    String phoneNumber = 'tel:$number';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  Widget customBox1(String topText, String downText, Widget icon) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      padding: const EdgeInsets.fromLTRB(0, 19, 0, 19),
      width: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.primaryColorLight2,
              AppColor.whiteColor,
            ]),
        borderRadius: BorderRadius.circular(11.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40, width: 40, child: icon),
          const SizedBox(
            height: 5,
          ),
          commonText(topText, size: 10, color: AppColor.primaryColor),
          commonText(downText,
              size: 12, color: AppColor.blackColor, isBold: true),
        ],
      ),
    );
  }

  // Widget customBox2(String text) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: AppColor.primaryColor,
  //         width: 1,
  //       ),
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     child: commonText(text, size: 12, color: AppColor.primaryColor),
  //   );
  // }

  Widget descriptionTab() {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(28, 15, 29, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         /*   SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customBox1("Residence", widget.data.residenceType!,
                      Image.asset("assets/icons/home.png")),
                  customBox1("Bedrooms", widget.data.bedrooms!,
                      Image.asset("assets/icons/bedroom.png")),
                  customBox1("Bathrooms", widget.data.bathrooms!,
                      Image.asset("assets/icons/bathroom.png")),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),*/
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About Residence'.tr,
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFF131D27),
                      ),
                    ),
                  ),
                ),*/
                ExpandableText(
                  widget.data.propertyAbout!,
                  expandText: 'Read more'.tr,
                  collapseText: 'Show less'.tr,
                  maxLines: 9,
                  linkColor: AppColor.primaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(GoogleMapScreen(
                    location: LatLng(widget.data.location!.latitude!,
                        widget.data.location!.longitude!)));
              },
              child: Container(
                height: 200,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.amber,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      commonText('Do you want to delete?'.tr,
                          size: 20.0, isBold: true),
                      commonText("Sure want to delete this listing?", size: 14)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColor.whiteColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: commonText('Cancel'.tr,
                                isBold: true,
                                color: AppColor.blackColor,
                                size: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              AddResidencesModel model = await api
                                  .deleteResidencesApi(widget.data.sId!);

                              if (model.success == true) {
                                Utils.snackBar(
                                    "Delete Successfully", model.message!);
                                await residencesController.fetchData();
                                Get.offAll(const GuestRootScreen());
                              } else {
                                Utils.snackBar("Error", model.message!);
                                Get.back();
                              }
                            } on Exception catch (e) {
                              log(e.toString());
                              Utils.snackBar("Error", "Some Error occure");
                              Get.back();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: commonText(
                              'Delete'.tr,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget galleryTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              commonText("Gallery".tr, size: 14, isBold: true),
              commonText("(${widget.data.images!.length})",
                  size: 14, color: AppColor.primaryColor, isBold: true),
            ],
          ),
          const SizedBox(height: 10),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              pattern: [
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(1, 2),
                const QuiltedGridTile(1, 2),
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(2, 4),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: widget.data.images!.length,
              (context, index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.data.images![index].url!,
                            ))),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget reviewTab() {
    RatingController controller = Get.put(RatingController(widget.data.sId!));
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (controller.isLoading.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }
              return controller.list.isEmpty
                  ? Center(
                      child: commonText("No review found".tr),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 10.1, 0),
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            color: const Color(0xFFD9D9D9),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                DummyImage.networkImage,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 6, 0, 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              commonText(
                                                  controller
                                                      .list[index].user!.name!,
                                                  size: 14,
                                                  isBold: true),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RatingBar.builder(
                                                itemSize: controller
                                                    .list[index].rating!
                                                    .toDouble(),
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  log(rating.toString());
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExpandableText(
                                      controller.list[index].comment!,
                                      expandText: 'Read more'.tr,
                                      collapseText: 'Show less'.tr,
                                      maxLines: 4,
                                      linkColor: AppColor.primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        height: 140,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .list[index].images!.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius
                                                          .vertical(
                                                          top: Radius.circular(
                                                              12),
                                                          bottom:
                                                              Radius.circular(
                                                                  12)),
                                                  child: Image.network(
                                                    controller.list[index]
                                                        .images![index].url!,
                                                    fit: BoxFit.cover,
                                                    width: 160,
                                                  ),
                                                ),
                                              );
                                            }))
                                  ],
                                ),
                              ]),
                        );
                      });
            }),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     commonText("View more...".tr,
            //         isBold: true, color: AppColor.primaryColor),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget buildItem(String item, {String? path}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        children: [
          if (path != null)
            Image.asset(path,
                width: 15, height: 15, color: AppColor.primaryColor),
          if (path != null)
            const SizedBox(
              width: 2,
            ),
          commonText(item, isBold: true, color: AppColor.primaryColor),
        ],
      ),
    );
  }
}

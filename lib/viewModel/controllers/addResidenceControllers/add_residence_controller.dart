import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:real_estate_management/models/categories_model/categories_model.dart';

import 'package:real_estate_management/models/residencesModels/add_residence_model.dart'
    as addresidence;
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/repository/residences_repository/add_residence_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';

import '../../../res/app_url/app_url.dart';
import '../../../service/base_client.dart';
import '../../../view/host/addResidenceScreens/want_payment.dart';
import '../ResidencesControllers/residences_controller.dart';

class AddResidenceController extends GetxController {

  var isLoading = false.obs;
  final ResidencesController residencesController =
  Get.put(ResidencesController(), permanent: false);

  var categories = CategoriesModel().obs;
  var categoryList = <CategoryData>[].obs;
  var catNameList = <String>[].obs;
  var catIdList = <String>[].obs;




  var selectedgovernorate = "Al Asimah (Kuwait City)".obs;
  var selectedarea = "Kuwait City".obs;

  AddResidenceController() {
    propertyFeaturesController = Get.put(
      DropdownController([
        'Furnished',
        'Balcony',
        'Central A.C',
        'Elevator',
        'Parking',
        'Maids Room',
        'Security',
        'Reception',
        'Sea View',
        'Gym',
        'Bath Tub',
        'Swimming Pool',
        'Dewaniya',
        'WiFi',
        'Washer',
        'Dryer',
        'Kitchenware',
        'Toiletries'
      ], selected: "Furnished"),
      tag: 'Property Features',
    );
    governorateToAreas = {
      'Al Asimah (Kuwait City)': [
        'Kuwait City',
        'Dasman',
        'Sharq',
        'Dasma',
        'Daiya',
        'Sawabir',
        'Mirgab',
        'Jibla',
        'Salhiya',
        'Bneid il-Gar',
        'Kaifan'
      ],
      'Hawalli': ['Hawalli', 'Rumaithiya', 'Jabriya', 'Salmiya'],
      'Mubarak Al Kabeer': [
        'Mubarak Al Kabeer',
        'Adan',
        'Qurain',
        'Qosor',
        'Sabah Al Salim'
      ],
      'Ahmadi': ['Ahmadi', 'Fintas', 'Mahbula', 'Abu Halifa', 'Mangaf'],
      'Jahra': ['Jahra', 'Sulaibiya', 'Saad Al Abdullah', 'Naeem'],
      'Farwaniya': ['Farwaniya', 'Abdullah Al Mubarak', 'Andalus', 'Khaitan'],
    };

    governorateController = Get.put(
        DropdownController([
          "Al Asimah (Kuwait City)",
          "Hawalli",
          "Mubarak Al Kabeer",
          "Ahmadi",
          "Jahra",
          "Farwaniya"
        ], selected: selectedgovernorate.value),
        tag: 'Governorate');

    areaController = Get.put(
        DropdownController([], selected: selectedarea.value),
        tag: 'Area');
  }

  final facilitiesSelected = <String, bool>{}.obs;
  final _api = AddResidencesRepository();

  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController aboutPropertyController = TextEditingController();
  final TextEditingController squareFeetController = TextEditingController();
  final TextEditingController rulesController = TextEditingController();

  final TextEditingController blockController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController paciNoController = TextEditingController();
  final TextEditingController rentPerMonthController = TextEditingController();
  final TextEditingController rentPerNightController = TextEditingController();
  final TextEditingController checkInInstructionsController =
      TextEditingController();
  final TextEditingController hostNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController depositeController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController avenueController = TextEditingController();
  final TextEditingController aditionalController = TextEditingController();
  late DropdownController propertyFeaturesController;
  late DropdownController governorateController;
  late DropdownController areaController;
  Map<String, List<String>> governorateToAreas = <String, List<String>>{}.obs;
  RxInt bathrooms = 1.obs;
  RxInt bedrooms = 1.obs;
  RxInt grace = 1.obs;
  RxString address = "Manhattan, New York".obs;
  RxString latitude = "".obs;
  RxString longitude = "".obs;
  RxString coordinates1 = "".obs;
  RxString coordinates2 = "".obs;
  RxString residenceType = "Condominium".obs;
  RxString rentingType = "Short Term".obs;
  RxString paymentType = "Per Night".obs;
  addresidence.AddResidencesModel model = addresidence.AddResidencesModel();

  RxString residenceId = "".obs;
  RxList<File> pickedImages = RxList<File>([]);
  RxList<Images> images = RxList<Images>([]);
  RxList<File> pickedVideos = RxList<File>([]);
  RxList<Images> videos = RxList<Images>([]);
  final ImagePicker picker = ImagePicker();
  Rx<String> selectedTypeId = Rx<String>('');

  void selectRole(String id) {
    selectedTypeId.value = id;
  }

  Future<void> pickImages() async {
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null && images.length <= 10) {
      pickedImages.value = images.map((image) => File(image.path)).toList();
    } else {
      Utils.snackBar("Error", "You can select up to 10 images.");
    }
  }

  Future<void> pickVideos() async {
    List<File> videos = [];
    for (int i = 0; i < 1; i++) {
      final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        videos.add(File(video.path));
      } else {
        break;
      }
    }
    if (videos.length <= 5) {
      pickedVideos.value = videos;
    } else {
      // Handle error or show a message to the user about the limit
      Utils.snackBar("Error", "You can select up to 5 videos.");
    }
  }

  final List<String> facilities = [
    'Furnished',
    'Dewaniya',
    'Security',
    'WiFi',
    'Reception',
    'Washer',
    'Sea View',
    'Dryer',
    'Gym',
    'Kitchenware',
    'Bath Tub',
    'Toiletries',
    'Swimming Pool',
    'Restaurants',
    'Supermarket'
  ];

  final RxList<Map<String, dynamic>> certificates = [
    {"label": "Marriage Certificate", "isEnabled": true},
    {"label": "Criminal Status Certificate", "isEnabled": true},
    {"label": "Salary Certificate", "isEnabled": true},
    {"label": "Bank Statement", "isEnabled": false},
    {"label": "Passport (Non-Kuwaiti)", "isEnabled": false},
  ].obs;

  final RxList<Map<String, String>> features = [
    {"icon": "Elevator", "label": "Elevator"},
    {"icon": "Security", "label": "Security"},
    {"icon": "Parking", "label": "Parking"},
    {"icon": "Furnished", "label": "Furnished"},
    {"icon": "WiFi", "label": "WiFi"},
    {"icon": "Pool", "label": "Pool"},
    {"icon": "Maids Room", "label": "Maids Room"},
    {"icon": "Central A.C", "label": "Central A.C"},
    {"icon": "Jacuzzi", "label": "Jacuzzi"},
    {"icon": "Driver Room", "label": "Driver Room"},
    {"icon": "Dewaniya", "label": "Dewaniya"},
    {"icon": "Sea View", "label": "Sea View"},
    {"icon": "Kitchenware", "label": "Kitchenware"},
    {"icon": "Pet Friendly", "label": "Pet Friendly"},
    {"icon": "Balcony", "label": "Balcony"},
    {"icon": "Gym", "label": "Gym"},
  ].obs;
  RxSet<String> selectedFeatures = <String>{}.obs;

  @override
  void onInit() {
    super.onInit();

    getCategory();


    for (var facility in facilities) {
      facilitiesSelected[facility] = false;
    }
  }

  List<String> getSelectedFacilities() {
    return facilitiesSelected.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  RxBool loading = false.obs;

  bool validateFirstPage() {
    List<TextEditingController> requiredControllers = [
      propertyNameController,
      squareFeetController,
    ];

   /* for (var ctrl in requiredControllers) {
      if (ctrl.text.isEmpty) {
        Utils.snackBar("Validation Error", "Please fill all required fields");
        return false;
      }
    }*/

    if(requiredControllers[0].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill Property Name");
      return false;
    }
    if(requiredControllers[1].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill Property Size");
      return false;
    }

    if (images.isEmpty) {
      if (pickedImages.isEmpty) {
        Utils.snackBar("Validation Error", "Please upload at least one photo");
        return false;
      }
    }

    if (selectedTypeId.value.isEmpty) {
      Utils.snackBar("Validation Error", "Please select a property category");
      return false;
    }

    return true;
  }

  bool validateFeaturePage() {
    List<TextEditingController> requiredControllers = [aboutPropertyController];

    for (var ctrl in requiredControllers) {
      if (ctrl.text.isEmpty) {
        Utils.snackBar("Validation Error", "Please fill About Residence");
        return false;
      }
    }
    if (selectedFeatures.isEmpty) {
      Utils.snackBar("Validation Error", "Please select atleast on feature");
      return false;
    }

    return true;
  }

  bool validateRequirementPage() {
    List<TextEditingController> requiredControllers = [
     // depositeController,
      rentController
    ];

 /*   for (var ctrl in requiredControllers) {
      if (ctrl.text.isEmpty) {
        Utils.snackBar("Validation Error", "Please fill all required fields");
        return false;
      }
    }*/
/*    if(requiredControllers[0].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill Property Name");
      return false;
    }*/
    if(requiredControllers[0].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill rent amount");
      return false;
    }
    return true;
  }

  bool validateSecondPage() {
    List<TextEditingController> requiredControllers = [
      blockController,
      streetController,
      houseController,
      floorController,
      apartmentController,
      aditionalController
    ];

   /* for (var ctrl in requiredControllers) {
      if (ctrl.text.isEmpty) {
        Utils.snackBar("Validation Error", "Please fill all required fields");
        return false;
      }
    }*/
    if(requiredControllers[0].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill block No");
      return false;
    }
    if(requiredControllers[1].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill street No");
      return false;
    }
    if(requiredControllers[2].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill house No");
      return false;
    }
    if(requiredControllers[3].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill floor No");
      return false;
    }
    if(requiredControllers[4].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill apartment No");
      return false;
    }
    if(requiredControllers[5].text.isEmpty){
      Utils.snackBar("Validation Error", "Please fill additional directions");
      return false;
    }

    return true;
  }

  void resetFormData() {
    propertyNameController.clear();
    aboutPropertyController.clear();
    squareFeetController.clear();
    rulesController.clear();
    blockController.clear();
    streetController.clear();
    houseController.clear();
    floorController.clear();
    apartmentController.clear();
    paciNoController.clear();
    checkInInstructionsController.clear();
    hostNameController.clear();
    aboutController.clear();

    pickedImages.clear();
    pickedVideos.clear();

    facilitiesSelected.forEach((key, value) {
      facilitiesSelected[key] = false;
    });
  }

  void loginApi(bool isEdit) async {
    try {
      loading.value = true;
      List<String> selectedFacilities = getSelectedFacilities();

      Map<String, dynamic> address = {
        "governorate": governorateController.selected.value,
        "area": areaController.selected.value,
        "block": blockController.text,
        "street": streetController.text,
        "house": houseController.text,
        "floor": floorController.text,
        "apartment": apartmentController.text,
        "avenue": avenueController.text,
        "additionalDirections": aditionalController.text
      };

      Map<String, dynamic> location = {
        "latitude": latitude.value,
        "longitude": longitude.value,
        "coordinates": [latitude.value, longitude.value],
        "type": "Point",
      };
      Map<String, dynamic> document = {
        "marriageCertificate": certificates[0]["isEnabled"],
        "criminalStatusCertificate": certificates[1]["isEnabled"],
        "salaryCertificate": certificates[2]["isEnabled"],
        "bankStatement": certificates[3]["isEnabled"],
        "passport": certificates[4]["isEnabled"]
      };

      Map<String, dynamic> nonFileData = {
        "propertyName": propertyNameController.text,
        "propertyAbout": aboutPropertyController.text,
        "squareFeet": squareFeetController.text,
        "bedrooms": bathrooms.value.toString(),
        "bathrooms": bathrooms.value.toString(),
        "rules": rulesController.text,
        "rentType": rentingType.value,
        "paymentType": paymentType.value,
        "address": address,
        // "paciNo": int.parse(paciNoController.text),
        "facilities": selectedFacilities,
        "instructions": checkInInstructionsController.text,
        "hostAbout": aboutController.text,
        "category": selectedTypeId.value,
        "isDeleted": false,
        "residenceType": residenceType.value,
        "rent": rentController.text,
        "gracePeriod": grace.value.toString(),
        // "perNightPrice": int.parse(rentPerNightController.text),
        // "perMonthPrice": int.parse(rentPerMonthController.text),
        "deposit": depositeController.text,
        "features": selectedFeatures.toList(),
        // "discount": 15, // replace with actual discount
        // "discountCode": "WINTER2024", // replace with actual discount code
        "location": location,
        "document": document,
      };

      String jsonData = jsonEncode(nonFileData);

      List<MultipartFile> imageFiles = [];
      List<MultipartFile> videoFiles = [];

      for (var image in pickedImages) {
        imageFiles.add(await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last));
      }

      for (var video in pickedVideos) {
        videoFiles.add(await MultipartFile.fromFile(video.path,
            filename: video.path.split('/').last));
      }

      final formData = FormData.fromMap({
        "data": jsonData,
        if (imageFiles.isNotEmpty) "images": imageFiles,
        if (videoFiles.isNotEmpty) "videos": videoFiles,
      });

      log(formData.fields.toString());
      log("files ${formData.files.toString()}");

      if (isEdit) {
        model = await _api.updateResidencesApi(formData, residenceId.value);
      } else {
        model = await _api.addResidencesApi(formData);
      }
      if (model.success == true) {
        await residencesController.fetchData();
        Get.offAll(const GuestRootScreen());
        Utils.snackBar(
            isEdit ? "Residence Updated" : "Residence Created", model.message!);
        resetFormData();
      } else {
        Utils.snackBar("Problem", model.message!);
      }

     // await residencesController.fetchData();

    } catch (error) {
      log(error.toString());
      //Utils.snackBar("Error", error.toString());
    } finally {
      loading.value = false;
    }
  }

  ///getCategory
  getCategory() async {
    try {
      isLoading(true);


      var headers = {
        'Content-Type': 'application/json',
        //  'Accept': 'application/json',
       // "Authorization": "Bearer $token" ?? ''
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: AppUrl.categories,headers: headers),
      );
      if (responseBody != null) {
        categoryList.clear();
        catNameList.clear();
        catIdList.clear();

        categories.value = CategoriesModel.fromJson(responseBody);
        categoryList.addAll(categories.value.data!.data);

        catNameList.value = categoryList.map((e) => e.name.toString()).toList();
        catIdList.value = categoryList.map((e) => e.id.toString()).toList();

        catNameList.insert(0, "All");
        catIdList.insert(0, "");


        isLoading(false);

      } else {
        throw 'Unable to load payment data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }



}

class PropertyType {
  String id;
  String name;
  bool isDeleted;
  RxBool isSelected = false.obs;

  PropertyType({required this.id, required this.name, required this.isDeleted});
}

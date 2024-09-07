import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class FilterController extends GetxController {
  RxList<PropertyType> propertyTypes = <PropertyType>[
    PropertyType(
        id: "665f4139e5a7d1307af31fb8", name: "House", isDeleted: false),
    PropertyType(
        id: "66657b41c0ea42c1735699e6", name: "Apartment", isDeleted: false),
    PropertyType(
        id: "667d4e9449966c292d2a5e09", name: "Chalet", isDeleted: false),
    PropertyType(
        id: "668ff0392f98572eabf671cc", name: "Farm", isDeleted: false),
    PropertyType(
        id: "668ff0392f98572eabf671ce", name: "Commercial", isDeleted: false),
    PropertyType(
        id: "668ff0392f98572eabf671cd", name: "Land", isDeleted: false),
  ].obs;

  RxDouble budget = 10.0.obs;
  Rx<RangeValues> budgetRange = const RangeValues(0, 100000).obs;

  RxInt selectedRooms = 0.obs;

  RxString duration = ''.obs;

  RxString residence = ''.obs;

  RxList<PropertyType> features = <PropertyType>[
    PropertyType(id: "1", name: "Furnished", isDeleted: false),
    PropertyType(id: "2", name: "Elevator", isDeleted: false),
    PropertyType(id: "3", name: "Balcony", isDeleted: false),
    PropertyType(id: "4", name: "Maids Room", isDeleted: false),
    PropertyType(id: "5", name: "Sea View", isDeleted: false),
    PropertyType(id: "6", name: "Gym", isDeleted: false),
    PropertyType(id: "7", name: "Swimming Pool", isDeleted: false),
    PropertyType(id: "8", name: "Dewaniya", isDeleted: false),
    PropertyType(id: "9", name: "WiFi", isDeleted: false),
  ].obs;

  RxString apartmentType = ''.obs;

  RxString governorate = ''.obs;

  void togglePropertySelection(PropertyType selectedProperty) {
    for (var property in propertyTypes) {
      if (property.id != selectedProperty.id) {
        property.isSelected.value = false;
      }
    }
    selectedProperty.isSelected.value = !selectedProperty.isSelected.value;
  }

  void toggleFeatureSelection(PropertyType selectedFeature) {
    selectedFeature.isSelected.value = !selectedFeature.isSelected.value;
  }

  String? get selectedPropertyId =>
      propertyTypes.firstWhereOrNull((p) => p.isSelected.value)?.id;
}








// import 'package:get/get.dart';
// import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

// class FilterController extends GetxController {
//   RxList<PropertyType> propertyTypes = <PropertyType>[
//     PropertyType(
//         id: "665f4139e5a7d1307af31fb8", name: "House", isDeleted: false),
//     PropertyType(
//         id: "66657b41c0ea42c1735699e6", name: "Apartment", isDeleted: false),
//     PropertyType(
//         id: "667d4e9449966c292d2a5e09", name: "Chalet", isDeleted: false),
//     PropertyType(
//         id: "668ff0392f98572eabf671cc", name: "Farm", isDeleted: false),
//     PropertyType(
//         id: "668ff0392f98572eabf671ce", name: "Commercial", isDeleted: false),
//     PropertyType(
//         id: "668ff0392f98572eabf671cd", name: "Land", isDeleted: false),
//   ].obs;
//   void togglePropertySelection(PropertyType selectedProperty) {
//     for (var property in propertyTypes) {
//       if (property.id != selectedProperty.id) {
//         property.isSelected.value = false;
//       }
//     }
//     selectedProperty.isSelected.value = !selectedProperty.isSelected.value;
//   }

//   String? get selectedPropertyId =>
//       propertyTypes.firstWhereOrNull((p) => p.isSelected.value)?.id;
// }

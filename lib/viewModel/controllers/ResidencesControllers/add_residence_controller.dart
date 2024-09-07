import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/repository/residences_repository/add_residence_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class AddResidencesController extends GetxController {
  final _api = AddResidencesRepository();

  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController aboutPropertyController = TextEditingController();
  final TextEditingController squareFeetController = TextEditingController();
  final TextEditingController bedroomsController = TextEditingController();
  final TextEditingController bathroomsController = TextEditingController();
  final TextEditingController rulesController = TextEditingController();
  final TextEditingController shortTermController = TextEditingController();
  final TextEditingController longTermController = TextEditingController();
  final TextEditingController rentTypeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController blockController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController paciNoController = TextEditingController();
  final TextEditingController checkInInstructionsController =
      TextEditingController();
  final TextEditingController hostNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void addResidencesApi() {
    loading.value = true;
    Map<String, dynamic> data = {
      "propertyName": propertyNameController.text,
      "aboutProperty": aboutPropertyController.text,
      "squareFeet": int.parse(squareFeetController.text),
      "bedrooms": int.parse(bedroomsController.text),
      "bathrooms": double.parse(bathroomsController.text),
      "rules": rulesController.text,
      "shortTerm": shortTermController.text,
      "longTerm": longTermController.text,
      "rentType": rentTypeController.text,
      "price": int.parse(priceController.text),
      "address": {
        "governorate": governorateController.text,
        "area": areaController.text,
        "block": blockController.text,
        "street": streetController.text,
        "house": houseController.text,
        "floor": floorController.text,
        "apartment": apartmentController.text
      },
      "paciNo": paciNoController.text,
      "checkInInstructions": checkInInstructionsController.text,
      "hostName": hostNameController.text,
      "aboutHost": aboutController.text
    };
    log(data.toString());
    _api.addResidencesApi(data).then((value) {
      loading.value = false;
    }).onError((error, stackTrace) {
      loading.value = false;
      log(error.toString());
     // Utils.snackBar("Error", error.toString());
    });
  }
}

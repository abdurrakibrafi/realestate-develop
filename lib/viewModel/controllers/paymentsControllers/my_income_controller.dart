import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/paymentsModel/my_income_model.dart';
import 'package:real_estate_management/repository/payments_repository/my_income_repository.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_text.dart';

import 'package:real_estate_management/utils/utils.dart';

class MyIncomeController extends GetxController {
  final MyIncomeRepository _api = MyIncomeRepository();
  final Rx<Data?> myIncomeData = Rx<Data?>(null);
  var yearController = TextEditingController().obs;
  var isLoading = true.obs;
  var months = <String>[].obs;
  var incomes = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    yearController.value.text = DateTime.now().year.toString();
    fetchData();
  }

  void showYearPicker(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: commonText("Select a year",
                size: 14, color: AppColor.primaryColor),
            content: SizedBox(
              height: 200,
              width: 300,
              child: YearPicker(
                firstDate: DateTime(DateTime.now().year - 100, 1),
                lastDate: DateTime(DateTime.now().year + 100, 1),
                selectedDate: DateTime(int.parse(yearController.value.text)),
                onChanged: (DateTime newValue) {
                  yearController.value.text = newValue.year.toString();
                  fetchData();
                  Navigator.pop(context);
                },
              ),
            ),
          );
        });
  }

  void fetchData() async {
    isLoading(true);
    try {
      MyIncomeModel myIncomeModel =
          await _api.myIncomeApi(yearController.value.text);
      if (myIncomeModel.data != null && myIncomeModel.success == true) {
        myIncomeData.value = myIncomeModel.data;
        updateIncomeLists(myIncomeData.value);
      } else {
        Utils.snackBar("Error", "Failed to fetch data or no data available");
      }
    } catch (e) {
      log(e.toString());
      //Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void updateIncomeLists(Data? data) {
    if (data != null && data.monthlyIncome != null) {
      months.value = data.monthlyIncome!.map((item) => item.month!).toList();
      incomes.value = data.monthlyIncome!.map((item) => item.income!).toList();
    } else {
      months.clear();
      incomes.clear();
    }
  }
}

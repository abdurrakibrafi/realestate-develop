import 'package:get/get.dart';

class DropdownController extends GetxController {
  List<String> options;
  var selected = ''.obs;

  DropdownController(this.options, {String? selected}) {
    if (selected != null && options.contains(selected)) {
      this.selected.value = selected;
    }
  }
}
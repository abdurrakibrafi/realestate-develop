import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController {
  Future<bool> saveUser(
      String token, String id, String role, String name, String proImage) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", token);
    sp.setString("id", id);
    sp.setString("role", role);
    sp.setString("name", name);
    sp.setString("proImage", proImage);
    return true;
  }

  Future<bool> saveLanguage(String language) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("language", language);
    return true;
  }

  Future<String> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    return token ?? "";
  }

  Future<String> getId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? id = sp.getString("id");
    return id ?? "";
  }

  Future<String> getRole() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? role = sp.getString("role");
    return role ?? "";
  }

  Future<String> getLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? language = sp.getString("language");
    return language ?? "en";
  }

  Future<String> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? name = sp.getString("name");
    return name ?? "";
  }

  Future<String> getImage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? proImage = sp.getString("proImage");
    return proImage ?? "";
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}

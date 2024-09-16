import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_estate_management/service/socket_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:real_estate_management/res/getx_localization/languages.dart';
import 'package:real_estate_management/view/common/splashScreens/splash_screen_page.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log('Error initializing Firebase: $e');
  }

  // Get the preferred language
  String languageCode = await getLanguage();

  // Initialize GetStorage
  await GetStorage.init();

  // Initialize SocketService
  await Get.putAsync(() => SocketService().init());

  // Run the app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp(languageCode: languageCode));
  });
}

Future<String> getLanguage() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String? language = sp.getString("language");
  return language ?? "en";
}

class MyApp extends StatelessWidget {
  final String languageCode;
  final UserPreference userPreference = UserPreference();

  MyApp({super.key, required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Real Estate Management',
      locale: Locale(languageCode),
      fallbackLocale: languageCode == "en"
          ? const Locale("en", "US")
          : const Locale("ar", "SA"),
      translations: Language(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: FutureBuilder<String>(
        future: userPreference.getUser(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return const GuestRootScreen();
          } else {
            return const SplashScreenPage();
          }
        },
      ),
    );
  }
}

/*void resetApp() {
  Get.reset();
  main();
}*/

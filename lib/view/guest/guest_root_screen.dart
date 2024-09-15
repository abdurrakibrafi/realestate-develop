import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/view/common/profileScreens/profile_page.dart';
import 'package:real_estate_management/view/guest/favoriteScreens/favorite_page.dart';
import 'package:real_estate_management/view/guest/homePageScreens/adsScreens/ad_corner_page.dart';
import 'package:real_estate_management/view/guest/homePageScreens/home_page.dart';
import 'package:real_estate_management/view/common/messagesScreens/message_page.dart';
import 'package:real_estate_management/view/guest/homePageScreens/home_page_v2.dart';

class GuestRootScreen extends StatefulWidget {
 final int? indexValue;
  const GuestRootScreen({super.key, this.indexValue});

  @override
  State<GuestRootScreen> createState() => _GuestRootScreenState();
}

class _GuestRootScreenState extends State<GuestRootScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.indexValue??0;
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
   // HomePage(),
    HomePageV2(),
    AdsCornerPage(),
    MessagePage(),
    FavoritePage(),
    ProfilePage(isHost: true, isGuest: false)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/common/home-2.png'),
            ),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/common/servicves.png'),
            ),
            label: 'Services'.tr,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/common/message.png'),
            ),
            label: 'Chat'.tr,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/common/heart.png'),
            ),
            label: 'Favorite'.tr,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/common/profile-circle.png'),
            ),
            label: 'Profile'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );

    // Scaffold(
    //   body: <Widget>[
    //     const HomePage(),
    //     const PopularPage(),
    //     const MessagePage(),
    //     const NotificationPage(),
    //     const FavoritePage()
    //   ][currentPageIndex],
    //   bottomNavigationBar: NavigationBar(
    //     backgroundColor: Colors.white,
    //     surfaceTintColor: Colors.transparent,
    //     shadowColor: Colors.black,
    //     elevation: 20,
    //     onDestinationSelected: (int index) {
    //       setState(() {
    //         currentPageIndex = index;
    //       });
    //     },
    //     indicatorColor: Colors.redAccent[300],
    //     selectedIndex: currentPageIndex,
    //     destinations: <Widget>[
    //       NavigationDestination(
    //         icon: Image.asset(
    //           "assets/icons/bottomNavigation/homeIcon.png",
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Home',
    //       ),
    //       NavigationDestination(
    //         icon: Image.asset(
    //           "assets/icons/bottomNavigation/popularIcon.png",
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Popular',
    //       ),
    //       NavigationDestination(
    //         icon: Image.asset(
    //           "assets/icons/bottomNavigation/messageIcon.png",
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Message',
    //       ),
    //       NavigationDestination(
    //         icon: Image.asset(
    //           "assets/icons/bottomNavigation/notificationIcon.png",
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Notification',
    //       ),
    //       NavigationDestination(
    //         icon: Image.asset(
    //           "assets/icons/bottomNavigation/favoriteIcon.png",
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Favorite',
    //       ),
    //     ],
    //   ),
    // );
  }
}

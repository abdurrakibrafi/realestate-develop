import 'package:flutter/material.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/common/profileScreens/profile_page.dart';
import 'package:real_estate_management/view/common/messagesScreens/message_page.dart';
import 'package:real_estate_management/view/common/notificationsScreens/notification_page.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/add_residence_page.dart';
import 'package:real_estate_management/view/host/homePageScreens/home_page.dart';

class HostRootScreen extends StatefulWidget {
  const HostRootScreen({super.key});

  @override
  State<HostRootScreen> createState() => _HostRootScreenState();
}

class _HostRootScreenState extends State<HostRootScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MessagePage(),
    NotificationPage(),
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
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomAppBar(
          notchMargin: 0,
          color: AppColor.primaryColorLight,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(0);
                    },
                    child: Column(children: [
                      ImageIcon(
                        AssetImage(
                          'assets/icons/homeIcon.png',
                        ),
                        color: (_selectedIndex == 0)
                            ? Colors.amber[800]
                            : Colors.grey,
                      ),
                      commonText('Home',
                          color: (_selectedIndex == 0)
                              ? Colors.amber.shade800
                              : Colors.grey),
                    ]),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(1);
                    },
                    child: Column(children: [
                      ImageIcon(AssetImage('assets/icons/Chat.png'),
                          color: (_selectedIndex == 1)
                              ? Colors.amber.shade800
                              : Colors.grey),
                      commonText('Chat',
                          color: (_selectedIndex == 1)
                              ? Colors.amber.shade800
                              : Colors.grey),
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(2);
                    },
                    child: Column(children: [
                      ImageIcon(AssetImage('assets/icons/notificationIcon.png'),
                          color: (_selectedIndex == 2)
                              ? Colors.amber.shade800
                              : Colors.grey),
                      commonText('Notification',
                          color: (_selectedIndex == 2)
                              ? Colors.amber.shade800
                              : Colors.grey),
                    ]),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(3);
                    },
                    child: Column(children: [
                      ImageIcon(AssetImage('assets/icons/profileIcon.png'),
                          color: (_selectedIndex == 3)
                              ? Colors.amber.shade800
                              : Colors.grey),
                      commonText('Profile',
                          color: (_selectedIndex == 3)
                              ? Colors.amber.shade800
                              : Colors.grey),
                    ]),
                  ),
                ),
              ],
              // currentIndex: _selectedIndex,
              // showUnselectedLabels: true,
              // unselectedItemColor: Colors.grey,
              // selectedItemColor: Colors.amber[800],
              // backgroundColor: Colors.white,
              // onTap: _onItemTapped,
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddResidencePage(
                      isEdit: false,
                    )),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 5, color: AppColor.primaryColor),
              color: AppColor.primaryColorLight),
          child: Image.asset("assets/icons/add_Icon.png"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

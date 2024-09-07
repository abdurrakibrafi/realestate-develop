import 'package:flutter/material.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import 'package:real_estate_management/view/host/host_root_screen.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonButton("Guest", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GuestRootScreen()),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            commonBorderButton("Host", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HostRootScreen()),
              );
            })
          ],
        ),
      ),
    );
  }
}

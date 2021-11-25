import 'package:flutter/material.dart';
import 'package:my_first/pages/home_page.dart';
import 'package:my_first/pages/profile_page.dart';
import 'package:my_first/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
            backgroundColor: primaryColor,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top:10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: currentIndex == 0 ? blueColor : whiteColor,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top:10),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 21,
                    color: currentIndex == 1 ? blueColor : whiteColor,
                  ),
                ),
                label: '',
              )
            ]),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: blueColor,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}

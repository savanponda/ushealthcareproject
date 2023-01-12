import 'package:flutter/material.dart';
import '../../../helper/AssetsHelper.dart';
import '../../../style/AppColor.dart';
import '../home/home_PageScreen.dart';
import '../profile/profile_Screen.dart';
import 'CartScreen.dart';
import 'CategoryScreen.dart';
import 'WishlistScreen.dart';


class TabBarScreen extends StatefulWidget {

  TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}
class _TabBarScreenState extends State<TabBarScreen> {
  int currentIndex = 0;
  // List? screens;
  List screens = [
    homePageScreen(),
    CategoryScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: bottomBar(),
      // floatingActionButton: floatingButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget bottomBar() => BottomAppBar(
    shape:  CircularNotchedRectangle(),
    notchMargin: 2,
    child: SizedBox(
      height: 70,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_home.png"),
                  color: (currentIndex == 0)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_category.png"),
                  color: (currentIndex == 1)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "My-Cards"),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_heart.png"),
                  color: (currentIndex == 2)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Saved-Card"),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_bag.png"),
                  color: (currentIndex == 3)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Saved-Card"),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_profile.png"),
                  color: (currentIndex == 4)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Saved-Card"),
        ],
        backgroundColor: Colors.transparent,
        selectedItemColor:AppColor.appColor,
        unselectedItemColor: AppColor.appTitle,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    ),
  );

// Widget floatingButton() => Container(
  //   margin: const EdgeInsets.all(4),
  //   height: 50,
  //   width: 50,
  //   alignment: Alignment.center,
  //   child: FloatingActionButton(
  //     backgroundColor: AppColor.appButton,
  //     onPressed: () {
  //       // NavigatorHelper.add(addexpense());
  //     },
  //     child:  Icon(
  //       Icons.add,
  //       size: 24,
  //       color: AppColor.appColor,
  //     ),
  //
  //   ),
  // );
}
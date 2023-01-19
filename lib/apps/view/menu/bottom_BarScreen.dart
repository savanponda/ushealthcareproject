import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/cart_page/cart_page.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import '../../../helper/AssetsHelper.dart';
import '../../../style/AppColor.dart';
import '../cart/wishlist_page/wishlist_screen.dart';
import '../category_page/category_screen.dart';
import '../home_page/home_page.dart';
import '../profile/profile_Screen.dart';
import '../cart/CartScreen.dart';


class TabBarScreen extends StatefulWidget {

  TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}
class _TabBarScreenState extends State<TabBarScreen> {
  int currentIndex = 0;
  // List? screens;
  List screens = [
    HomePage(),
    CategoryScreen(),
    WishlistPage(),
    CartPage(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  void onTap(int index) {

    if(index==3){
      NavigatorHelper.add(CartPage());
      return;
    }
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
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10),
                child: Image(image: currentIndex==1?AssetsHelper.getIcon("ic_category_filled.png"):AssetsHelper.getIcon("ic_category.png"),
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
                child: Image(image: currentIndex==2?AssetsHelper.getIcon("ic_heart_filled.png"):AssetsHelper.getIcon("ic_heart.png"),
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
                child: Image(image: currentIndex==4?AssetsHelper.getIcon("ic_profile_filled.png"):AssetsHelper.getIcon("ic_profile.png"),
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
}
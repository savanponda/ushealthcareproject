import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/cart_page.dart';
import 'package:onlinebia/apps/view/category/category_page.dart';
import 'package:onlinebia/apps/view/home/home_page.dart';
import 'package:onlinebia/apps/view/profile/profile_page.dart';
import 'package:onlinebia/apps/view/wishlist/wishlist_screen.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:page_transition/page_transition.dart';


class TabBarPage extends StatefulWidget {

  TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}
class _TabBarPageState extends State<TabBarPage> {
  int currentIndex = 0;
  // List? screens;
  var random = Random().nextBool();
  List screens = [
    FadeInUp(child: HomePage(),delay: const Duration(milliseconds: 200),),
    CategoryPage(),
    WishlistPage(),
    CartPage(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  late AnimationController _controller;

  void onTap(int index) {
    // index==3?NavigatorHelper.addWithAnimation(AddCartPage()):NavigatorHelper.addWithAnimation(CartPage());
    if(index==3){
      NavigatorHelper.addWithAnimation(CartPage());
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
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 4,
                offset: Offset(0,-5), // changes position of shadow
              ),],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
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
    );
  }
}
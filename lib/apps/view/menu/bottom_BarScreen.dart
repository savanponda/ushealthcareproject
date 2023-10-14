import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/home/home_page.dart';
import 'package:onlinebia/apps/view/profile/profile_page.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/style/AppColor.dart';





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
    ProfilePage(),
    // (),
    // MediaPickerBottomSheet(callBack: (){},)
    // scanResult_Step1()
    // cameraScanner(),
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
                    border: Border.all(width:1, color: currentIndex==0?AppColor.appColor:Colors.grey.shade200),
                    // color: currentIndex==0?AppColor.appColorWhite:Colors.grey.shade200,
                    shape: BoxShape.circle

                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("Home.png"),
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
                    border: Border.all(width:1, color: currentIndex==1?AppColor.appColor:Colors.grey.shade200),

                    shape: BoxShape.circle

                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_message.png"),
                  color: (currentIndex == 1)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Message"),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    border: Border.all(width:1, color: currentIndex==2?AppColor.appColor:Colors.grey.shade200),

                    shape: BoxShape.circle

                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("Work.png"),
                  color: (currentIndex == 2)
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
                    border: Border.all(width:1, color: currentIndex==3?AppColor.appColor:Colors.grey.shade200),

                    shape: BoxShape.circle

                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("Notification.png"),
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
                    border: Border.all(width:1, color: currentIndex==4?AppColor.appColor:Colors.grey.shade200),

                    shape: BoxShape.circle

                ),
                padding: EdgeInsets.all(10),
                child: Image(image: AssetsHelper.getIcon("ic_category.png"),
                  color: (currentIndex == 4)
                      ? AppColor.appColor
                      : Colors.grey,
                  height: 24,
                  width: 24,
                ),
              ),
              label: "Saved-Card"),
          // BottomNavigationBarItem(
          //     icon: Container(
          //       padding: EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: AppColor.appColor,
          //       ),
          //       child: Icon(Icons.add,
          //         color: Colors.white
          //       ),
          //     ),
          //     backgroundColor: Colors.indigo,
          //     label: "Add"
          // ),
        ],
        backgroundColor: Colors.transparent,
        // selectedItemColor:AppColor.appButton,
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
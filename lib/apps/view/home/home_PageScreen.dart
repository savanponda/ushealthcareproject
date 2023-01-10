import 'package:flutter/material.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/Fonts.dart';
class homePageScreen extends StatefulWidget {
  const homePageScreen({Key? key}) : super(key: key);

  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<homePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "fashion"),
            showBackIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body: Container(
          child: SafeArea(
              child: SingleChildScrollView(
                    child: Column(
                      children: [

                      ],
                    ),
              ),
          ),
        )
    );
  }


  Widget getRow(String label, String label2, int select){
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                label,
                style: Fonts.appBarTextStyle,
              ),
            ),
            GestureDetector(
              onTap: (){
                if (select==1){
                  // NavigatorHelper.add(MyCardScreen());
                }else if (select==2){
                  // NavigatorHelper.add(ReminderPageScreen());
                }else if (select==3){
                  // NavigatorHelper.add(HomeView());
                }
              },
              child: Text(
                label2,
                style: Fonts.viewAllStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}


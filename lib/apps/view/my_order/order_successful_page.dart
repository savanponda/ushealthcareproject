import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/bottom_navigation/tab_bar_page.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';

class OrderSuccessfulPage extends StatefulWidget {
  const OrderSuccessfulPage({Key? key}) : super(key: key);

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage> {
  final controller = ConfettiController();
  @override
  void initState(){
    super.initState();
    controller.play();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 20,
                minimumSize: Size(2, 2),

              ),
              Text(
                buildTranslate(context, "successfulOrder"),
                textAlign: TextAlign.center,
                style: Fonts.titleStyle,
              ),
              Container(
                margin:  EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                child: Text(
                  buildTranslate(context, "successfuldescription"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: AppColor.appLightBlack,
                    fontFamily: "AppSemiBold",
                  ),
                ),
              ),
              WidgetHelper.getFieldSeparator(height: 30),
              ButtonView(
                color: AppColor.appColor,
                textColor: AppColor.Buttontext,
                borderColor:AppColor.appBarText,
                textSize: 16,
                radius: 30,
                iconData: true,
                onPressed: () {
                  //Scaffold.of(context).hideCurrentSnackBar();
                  NavigatorHelper.add(TabBarPage());
                },
                buttonTextName: buildTranslate(context, "keepShopping"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

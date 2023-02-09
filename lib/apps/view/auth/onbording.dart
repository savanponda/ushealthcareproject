import 'package:flutter/material.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'signin_page.dart';


class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: 120),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(urlImage),
            fit: BoxFit.cover
        )),

        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: TextStyle(
              fontSize: 33,
              fontStyle: FontStyle.normal,
              fontFamily: "AppRegular",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontFamily: "AppRegular",
              fontWeight: FontWeight.w500,
            ),
          ),

        ],
          ),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              urlImage: 'assets/images/onboarding_bg.png',
              title: 'Start Journey With Onlinebia',
              subtitle:
              "Smart, Gorgeous & Fashionable Collection",
            ),
            buildPage(
              urlImage: 'assets/images/onboarding_bg.png',
              title: 'Start Journey With Onlinebia',
              subtitle:
              "Smart, Gorgeous & Fashionable Collection",
            ),
            buildPage(
              urlImage: 'assets/images/onboarding_bg.png',
              title: 'Start Journey With Onlinebia',
              subtitle:
              "Smart, Gorgeous & Fashionable Collection",
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage?Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
        child: Container(
          height: 60,
          child: ButtonView(
            color: AppColor.appColor,
            textColor: AppColor.Buttontext,
            borderColor:AppColor.appBarText,
            textSize: 16,
            radius: 30,
            iconData: true,
            onPressed: () {
              //Scaffold.of(context).hideCurrentSnackBar();
              NavigatorHelper.add(SignInPage());
            },
            buttonTextName: buildTranslate(context, "getStarted"),
          ),
        ),
      ):Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        // height: 80,
        child: Row(
          children: [
            SizedBox(width: 5,),
            Expanded(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  spacing: 5,
                  dotWidth: 10,
                  dotHeight: 5,
                  dotColor: AppColor.appBgGray,
                  activeDotColor: AppColor.appColor,
                  expansionFactor: 2
                ),
                onDotClicked: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            Container(
              width: 68,
              height: 56,
              child: ButtonView(
                color: AppColor.appColor,
                textColor: AppColor.Buttontext,
                borderColor:AppColor.appBarText,
                textSize: 16,
                radius: 30,
                iconData: false,
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                buttonTextName: buildTranslate(context, "next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
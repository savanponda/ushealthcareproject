
import 'package:flutter/material.dart';
import 'package:UShealthcare/style/Fonts.dart';

import '../custom/DividerView.dart';
import '../localization/AppLocalizations.dart';
import '../style/AppColor.dart';
import 'AssetsHelper.dart';

class SocialLoginButtonHelper {
  static Color googleButtonText = const Color(0xff7f7f7f);
  static Color facebookButtonColor = const Color(0xff4267b2);
  static Color twitterButtonColor = const Color(0xff63a9eb);

  static Color insta1 = const Color(0xff721FE9);
  static Color insta2 = const Color(0xffE65E61);

  static Widget appleButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.appBarText,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child:Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Center(
                    child: Image(
                      image: AssetsHelper.getIcon("ic_apple.png"),
                      height: 22,
                      width: 30,
                    ),
                  ),

                ],
              ),),
        ],
      ),
    );
  }

  static Widget googleButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColor.appDivider, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Center(
            child: Image(
              image: AssetsHelper.getIcon("ic_google.png"),
              height: 22,
              width: 30,
            ),
          ),

        ],
      ),
    );
  }

  static Widget facebookButton(BuildContext context, {String? text}) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.appTitle, width: 1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image(
                    image: AssetsHelper.getIcon("ic_facebook.png"),
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DividerView(
                    width: 1,
                    height: 25,
                    color: AppColor.appTitle,
                  ),
                ],
              )),
          Align(
            alignment: Alignment.center,
            child: Text(
              text ?? buildTranslate(context, "signInWithFacebook")!,
              style: Fonts.buttonStyle.copyWith( color: AppColor.appTitle,),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  static Widget twitterButton(
      BuildContext context,
      ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: twitterButtonColor),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image(
              image: AssetsHelper.getIcon("ic_twitter.png"),
              height: 30,
              width: 30,
              color: AppColor.appBarText,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              buildTranslate(context, "signInWithTwitter")!,
              style: Fonts.buttonStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  static Widget instagramButton(
      BuildContext context,
      ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [insta1, insta2],
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image(
              image: AssetsHelper.getIcon("ic_instagram.png"),
              height: 30,
              width: 30,
              color: AppColor.appBarText,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              buildTranslate(context, "signInWithInstagram")!,
              style: Fonts.buttonStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

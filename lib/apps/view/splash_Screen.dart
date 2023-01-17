import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';
import '../../helper/AssetsHelper.dart';
import 'auth/login_Screen.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() => {
        Timer( Duration(seconds: 3),
                ()=>Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                        signInScreen()
                )
            )
        ),
        super.initState(),
      });
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:AppColor.appColor,
          image: DecorationImage(image:AssetsHelper.getIcon("bg_curves.png"),fit: BoxFit.cover),

        ),
        child: Center(
          child: Image(
              image:AssetsHelper.getLogo("logo_white.png"),
              width: MediaQuery.of(context).size.width* 0.8,
          ),
        ),
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/auth/onbording.dart';
import 'package:UShealthcare/apps/view/splash_Screen2.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>   with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() => {
        Timer( Duration(seconds: 3),
                ()=>Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                        splash_Screen2()
                )
            )
        ),
        super.initState(),
      });
    }
  }
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.fastOutSlowIn,
  //   reverseCurve: Curves.easeIn,
  // );

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
          color:AppColor.appColorbackground,
          image: DecorationImage(image:AssetsHelper.getIcon("bg_curves.png"),fit: BoxFit.cover),

        ),
        child: Center(
          child: Image(
              image:AssetsHelper.getLogo("ic_logo.png"),
              width: MediaQuery.of(context).size.width* 0.8,
          ),
        ),
      ),
    );
  }
}
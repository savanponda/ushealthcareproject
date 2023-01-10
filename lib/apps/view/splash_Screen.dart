import 'dart:async';
import 'package:flutter/material.dart';

import '../../custom/StatusBarView.dart';
import '../../helper/AssetsHelper.dart';
import 'auth/login_Screen.dart';
import 'home/home_PageScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
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
    return StatusBarView(
      isLight: true,
      child: Scaffold(
        body: Container(
            decoration: new BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetsHelper.getLogo(""),
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
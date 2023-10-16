import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/auth/login.dart';
import 'package:onlinebia/apps/view/auth/signin_page.dart';
import 'dart:ui';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/utils/Utils.dart';

class splash_Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: TextButton(
          // splashscreenfdK (1284:22077)
          onPressed: () {},
          style: TextButton.styleFrom (
            padding: EdgeInsets.zero,
          ),
          child: Container(
            width: double.infinity,
            height: 926*fem,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  // iphonexmockupfrontviewnew1mRT (1321:30583)
                  left: 90*fem,
                  top: 100*fem,
                  child: Align(
                    child: SizedBox(
                      width: 333.32*fem,
                      height: 504*fem,
                      child:Image(
                        image:AssetsHelper.ushealcarenurses("iphone-x-mockup-front-view-new-1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group1000003799sDb (1306:25694)
                  left: 0*fem,
                  top: 548*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24*fem, 32*fem, 32*fem, 100*fem),
                    width: 428*fem,
                    height: 378*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // browserequestsworknearbyprnshi (1284:22090)
                          constraints: BoxConstraints (
                            maxWidth: 280*fem,
                          ),
                          child: Text(
                            'Browse, requests, & work nearby PRN shifts.',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 32*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.25*ffem/fem,
                              color: Color(0xff434344),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32*fem,
                        ),
                        Container(
                          // rectangle4boo (1284:22089)
                          width: 178*fem,
                          height: 6*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(6*fem),
                            color: Color(0xff0075db),
                          ),
                        ),
                        SizedBox(
                          height: 32*fem,
                        ),
                        GestureDetector(
                          onTap: (){
                            NavigatorHelper.add(SignInPage());
                          },
                          child: Container(
                            // buttonvr5 (1284:22085)
                            width: double.infinity,
                            height: 56*fem,
                            decoration: BoxDecoration (
                              color: Color(0xff0075db),
                              borderRadius: BorderRadius.circular(4*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Get Started',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // rectangle21cd (1284:21578)
                  left: 0*fem,
                  top: 0*fem,
                  child: Align(
                    child: SizedBox(
                      width: 428*fem,
                      height: 548*fem,
                      child: Opacity(
                        opacity: 0.32,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0x51d2e4fc),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // frame6329ui1 (1284:21579)
                  left: 314*fem,
                  top: 447*fem,
                  child: Align(
                    child: SizedBox(
                      width: 56*fem,
                      height: 56*fem,
                      child:Image(
                        image:AssetsHelper.ushealcarenurses("frame-6329.png"),
                        width: 56*fem,
                        height: 56*fem,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // frame6330RRT (1284:21581)
                  left: 55*fem,
                  top: 109*fem,
                  child: Align(
                    child: SizedBox(
                      width: 56*fem,
                      height: 56*fem,
                      child:Image(
                        image:AssetsHelper.ushealcarenurses("frame-6330.png"),
                        width: 56*fem,
                        height: 56*fem,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // linkbuttonCMf (I1284:23197;1:536)
                  left: 375*fem,
                  top: 52*fem,
                  child: Align(
                    child: SizedBox(
                      width: 29*fem,
                      height: 24*fem,
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Manrope',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.7142857143*ffem/fem,
                          color: Color(0xff0075db),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group10000038011gGq (1321:30593)
                  left: 41*fem,
                  top: 202*fem,
                  child: Align(
                    child: SizedBox(
                      width: 337.81*fem,
                      height: 174*fem,
                      child:Image(
                        image:AssetsHelper.ushealcarenurses("group-1000003801-1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:expense_manager/Balance.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/ButtonView.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../style/Fonts.dart';



class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool lastPage = false;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 5.0,
      width: isActive ? 25.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive ? AppColor.appColor : AppColor.appDivider,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height:0.97*h,
            //color: Colors.amber,
            child: PageView(
              physics:  NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Container(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(image:AssetsHelper.getImage("onboarding_bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetsHelper.getImage("onboarding_bg.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetsHelper.getImage("onboarding_bg.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildPageIndicator(),

          ),
          Expanded(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _currentPage != _numPages - 1
                    ? Expanded(
                  child:    Container(
                    margin: const EdgeInsets.fromLTRB(200.0, 8.0, 10.0, 0.0),
                    // margin: new EdgeInsets.symmetric(horizontal: 110.5,vertical: 20),
                    child: ButtonView(
                      buttonTextName: "Next",
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                )
                    : const Text(''),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: _currentPage == _numPages - 1 ?
      Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(200.0, 8.0, 0, 10.0),
          height: 30,
          child: ButtonView(
            iconData: true,
            buttonTextName: buildTranslate(context, "getStarted"),
            onPressed: () => {
              // NavigatorHelper.add(Signup())
            },
          )
      )
          : const Text(''),
    );
  }
}
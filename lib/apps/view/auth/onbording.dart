// import 'package:expense_manager/Balance.dart';
import 'package:flutter/material.dart';

import '../../../custom/ButtonView.dart';
import '../../../helper/AssetsHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/AppColor.dart';
import '../../../style/fonts.dart';



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
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              children: _buildPageIndicator(),
            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child:
                  Text(
                    buildTranslate(context, "skip"),
                    // style: Fonts.bottomText,
                  ),
                  onPressed: () => {
                    // NavigatorHelper.add(Signup())
                  },
                ),
                _currentPage != _numPages - 1
                    ? Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 0.0, 50.0, 10.0),
                  // margin: new EdgeInsets.symmetric(horizontal: 110.5,vertical: 20),
                  child: Container(
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
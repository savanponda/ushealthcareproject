import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class HeaderLoader extends StatefulWidget {
  const HeaderLoader({Key? key}) : super(key: key);

  @override
  State<HeaderLoader> createState() => _HeaderLoaderState();
}

class _HeaderLoaderState extends State<HeaderLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(
        padding: EdgeInsets.only(left: 30,right: 30,bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppLoaders(height: 30, width: 30, radius: 5,reverse: true,),
            SizedBox(width: 10,),
            AppLoaders(height: 20, width:120, radius: 10),
          ],
        ),
      )]);
  }
}

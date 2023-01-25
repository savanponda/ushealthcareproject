import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../helper/AssetsHelper.dart';
import '../../../../../helper/WidgetHelper.dart';
import '../../../../../style/AppColor.dart';

class ColorItemTile extends StatelessWidget {
  int? index;
  ColorItemTile({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 22),
      child: Container(
        height: 21,
        width: 21,
        decoration: BoxDecoration(
          border: index==2?Border.all(
              width: 1,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ):null,
          shape: BoxShape.circle,
          // border: Border.all(color:AppColor.appDivider, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.3),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
          ),
        ),
      ),
    );
  }
}

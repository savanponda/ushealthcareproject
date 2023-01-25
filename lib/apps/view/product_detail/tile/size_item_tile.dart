import 'package:flutter/material.dart';

import '../../../../../helper/AssetsHelper.dart';
import '../../../../../helper/WidgetHelper.dart';
import '../../../../../style/AppColor.dart';

class SizeItemTile extends StatelessWidget {

  SizeItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5),),
          border: Border.all(color:AppColor.appDivider, width: 2),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Text("XXL",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "AppSemiBold",
                color: Colors.black,
              ),),
          ),
        ),
      ),
    );
  }
}

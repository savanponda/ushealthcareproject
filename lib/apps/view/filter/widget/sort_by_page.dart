import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/filter/tile/radio_select_tile.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class SortBy extends StatefulWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  State<SortBy> createState() => _SortByState();
}

class _SortByState extends State<SortBy> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35,),
          Text(buildTranslate(context, "SORTBy"),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "AppSemiBold",
            ),
          ),
          SizedBox(height: 34,),
          for(int index=0;index<5;index++)
            RadioSelectTile(Title: "Sub Total",)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/order_info_tile.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';


class OrderInfoList extends StatelessWidget {
  OrderInfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              Text(buildTranslate(context, "orderInfo"),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "AppSemiBold",
                )
              ),
              Wrap(
              spacing: MediaQuery.of(context).size.width*0.09,
              alignment: WrapAlignment.start,
              children: [
              for(int index=0;index<2;index++)
                OrderInfoTile()
              ],),

      ],
    );
  }
}

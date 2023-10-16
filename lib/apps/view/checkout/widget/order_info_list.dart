import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/order_info_tile.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';


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
              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OrderInfoTile(
                    index: index,
                  );
                },
              ),
             ],
    );
  }
}

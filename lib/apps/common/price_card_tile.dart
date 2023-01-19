import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../helper/AssetsHelper.dart';
import '../../helper/NavigatorHelper.dart';
import '../../helper/WidgetHelper.dart';
import '../../localization/AppLocalizations.dart';
import '../view/cart/ProductDetailScreen.dart';

class PriceCardTile extends StatelessWidget {
  const PriceCardTile({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      color: AppColor.appBgGray.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "AppSemiBold",
                    )
                ),
                Text("#127",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
            WidgetHelper.getFieldSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "AppSemiBold",
                    )
                ),
                Text("Free",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
            WidgetHelper.getFieldSeparator(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: AppColor.appDivider,
            ),
            WidgetHelper.getFieldSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "AppSemiBold",
                    )
                ),
                Text("#127",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
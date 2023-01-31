import 'package:flutter/material.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class PriceCardTile extends StatelessWidget {
  const PriceCardTile({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.18,
      color: AppColor.appBgGray.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(buildTranslate(context, "subTotal"),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "AppSemiBold",
                    )
                ),
                Text("#127",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
            WidgetHelper.getFieldSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(buildTranslate(context, "shipping"),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "AppSemiBold",
                    )
                ),
                Text(buildTranslate(context, "free"),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
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
                Text(buildTranslate(context, "total"),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
          ],
        ),
      ),
    );

  }
}
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/address/add_address_page/add_address_page.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class DeliveryAddress extends StatelessWidget {
  DeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(buildTranslate(context, "deliveryLocation"),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: "AppSemiBold",
            )
        ),
        WidgetHelper.getFieldSeparator(),
        Row(
          children: [
            Expanded(
              child: Text(buildTranslate(context, "johnDieselHome"),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
            onTap: (){
                NavigatorHelper.add(AddAddressPage());
              },
            child: Image(
              image: AssetsHelper.getIcon("ic_edit.png"),
                      height: 20, width: 20,)),

          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              child: Text(buildTranslate(context, "exAddress"),
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "AppRegular",
                  color: AppColor.appSubTitleText,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

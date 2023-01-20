import 'package:flutter/material.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

import '../../../../../helper/AssetsHelper.dart';
import '../../../../../style/AppColor.dart';

class DeliveryAddress extends StatelessWidget {
  DeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery Location",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "AppSemiBold",
            )
        ),
        WidgetHelper.getFieldSeparator(),
        Row(
          children: [
            Expanded(
              child: Text("John Diesel Home",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Image(image: AssetsHelper.getIcon("ic_edit.png"), height: 20, width: 20,),

          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              child: Text("23rd Street, Zara Circle, Western Railway, UK.",
                style: TextStyle(
                  fontSize: 14,
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

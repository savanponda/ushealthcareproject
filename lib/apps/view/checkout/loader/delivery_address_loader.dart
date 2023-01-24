import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';

import '../../../../helper/WidgetHelper.dart';

class DeliveryAddressLoader extends StatelessWidget {
  const DeliveryAddressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLoaders(height: 20, width: 140, radius: 10,reverse: true,),
        WidgetHelper.getFieldSeparator(),
        Row(
          children: [
            Expanded(
              child:  AppLoaders(height: 20, width: 10, radius: 10),
            ),
            Expanded(child:SizedBox()),
            AppLoaders(height: 20, width: 20, radius: 5,reverse: true,),

          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              child:  AppLoaders(height: 20, width: 120, radius: 10),
            ),
          ],
        ),
      ],
    );
  }
}

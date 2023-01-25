import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class MyPaymentPageLoader extends StatelessWidget {
  const MyPaymentPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             AppLoaders(height: 60, width: 60, radius: 40,reverse: true,),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: AppLoaders(height: 20, width: 50, radius: 10)),
                        SizedBox(width: 50,),
                        AppLoaders(height: 20, width: 20, radius: 20,reverse: true,),
                      ],
                    ),
                    WidgetHelper.getFieldSeparator(),
                    AppLoaders(height: 20, width: 200, radius: 10,reverse: true,),
                    WidgetHelper.getFieldSeparator(),
                    AppLoaders(height: 20, width: 100, radius: 10,reverse: true,),
                    WidgetHelper.getFieldSeparator(),
                  ],),
              ),
            ],),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),

        ],
      ),
    );
  }
}

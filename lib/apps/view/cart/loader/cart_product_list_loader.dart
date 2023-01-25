import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class CartProductListLoader extends StatelessWidget {
   CartProductListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      elevation: 2,
      child: Column(
        children: [
          WidgetHelper.getFieldSeparator(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: AppLoaders(height: 80, width: 80, radius: 10,reverse: true,)
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLoaders(height: 20, width: 100, radius: 10),
                      SizedBox(height: 10,),
                      AppLoaders(height: 20, width: 50, radius: 10,reverse: true,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                                children: [
                                  AppLoaders(height: 20, width: 50, radius: 10),
                                ]
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      AppLoaders(height: 20, width: 20, radius: 5,reverse: true,),
                      SizedBox(width: 10,),
                      AppLoaders(height: 20, width: 100, radius: 10)
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  height: 50,
                  color: AppColor.appDivider,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLoaders(height: 20, width: 20, radius: 5,reverse: true,),
                      SizedBox(width: 10,),
                      AppLoaders(height: 20, width: 100, radius: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

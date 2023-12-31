import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:UShealthcare/custom/app_loader.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class CartProductListLoader extends StatelessWidget {
   CartProductListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15),),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: Offset(0,0), // changes position of shadow
          ),],
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          WidgetHelper.getFieldSeparator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
          WidgetHelper.getFieldSeparator(),
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

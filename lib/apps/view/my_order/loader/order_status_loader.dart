import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class OrderStatusLoader extends StatelessWidget {
  int? index;
   OrderStatusLoader({Key? key,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          WidgetHelper.getFieldSeparator(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Wrap(
              spacing: MediaQuery.of(context).size.width,
              alignment: WrapAlignment.start,
              children: [
                for(int index=0;index<5;index++)
                 Container(
                     child: Padding(
                       padding: EdgeInsets.symmetric(vertical: 5),
                       child: Column(
                         children: [
                           index==0?Container():Container(
                             width: MediaQuery.of(context).size.width,
                             height: 1,
                             color: AppColor.appDivider,
                           ),
                           SizedBox(height: 10,),

                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Container(
                                   height: 80,
                                   width: 80,
                                   child:  AppLoaders(height: 80, width: 80, radius: 10,reverse: true,)
                               ),
                               SizedBox(width: 20,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     AppLoaders(height: 18, width: 60, radius: 10),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                          AppLoaders(height: 20, width: 35, radius: 10,reverse: true,),
                                         SizedBox(width: 15,),
                                         AppLoaders(height: 20, width: 38, radius: 10),
                                       ],
                                     ),
                                     SizedBox(height: 10,),
                                     AppLoaders(height: 20, width: 90, radius: 10,reverse: true,),

                                   ],
                                 ),
                               ),
                               AppLoaders(height: 20, width: 80, radius: 5),
                             ],
                           ),
                         ],
                       ),
                     )
                 )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

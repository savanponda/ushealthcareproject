import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/checkout/loader/order_info_list_loader.dart';
import 'package:UShealthcare/apps/view/order_summary/loader/order_details_list_loader.dart';
import 'package:UShealthcare/custom/app_loader.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';

class OrderDetailNoLoader extends StatelessWidget {
  int? index;

   OrderDetailNoLoader({Key? key,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 21,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLoaders(height: 20, width: 80, radius: 20,reverse: true,),
                AppLoaders(height: 20, width: 80, radius: 20)
              ],
            ),
          ),
          for(int index=0;index<3;index++)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: OrderDetailsListLoader(),
                ),
                WidgetHelper.getDivider(width:MediaQuery.of(context).size.width*0.76),
              ],
            ),
          WidgetHelper.getFieldSeparator(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppLoaders(height: 20, width: 80, radius: 20),
              SizedBox(width: 30,),
              AppLoaders(height: 20, width: 80, radius: 20,reverse: true,)
            ],
          ),
          WidgetHelper.getFieldSeparator(height: 40),
        ],
      ),
    );
  }
}

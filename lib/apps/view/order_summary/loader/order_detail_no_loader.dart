import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/checkout/loader/order_info_list_loader.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

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
                AppLoaders(height: 20, width: 80, radius: 20),
                AppLoaders(height: 20, width: 80, radius: 20)
              ],
            ),
          ),
          for(int index=0;index<3;index++)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child:  OrderInfoListLoader(),
                ),],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppLoaders(height: 20, width: 80, radius: 20),
              SizedBox(width: 30,),
              AppLoaders(height: 20, width: 80, radius: 20)
            ],
          ),
          // Wrap(
          //   spacing: MediaQuery.of(context).size.width*0.09,
          //   alignment: WrapAlignment.start,
          //   children: [
          //     for(int index=0;index<3;index++)
          //       ProductDetailsTile(),
          //     WidgetHelper.getDivider(width:MediaQuery.of(context).size.width)
          //   ],),

        ],
      ),
    );
  }
}

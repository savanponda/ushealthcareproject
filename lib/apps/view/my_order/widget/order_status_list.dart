import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/order_info_tile.dart';
import 'package:UShealthcare/apps/enum/order_status_main.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';


class OrderStatusList extends StatelessWidget {
  OrderStatusMain? orderStatus;
  OrderStatusList({Key? key, this.orderStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
                  WidgetHelper.getFieldSeparator(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Wrap(
                    spacing: MediaQuery.of(context).size.width,
                    alignment: WrapAlignment.start,
                    children: [
                    for(int index=0;index<7;index++)
                      OrderInfoTile(
                        orderStatusName: orderStatus,index: index,),
                    ],),
                  ),

          ],
        ),
      ),
    );
  }
}

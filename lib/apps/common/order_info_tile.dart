import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/enum/order_status_main.dart';
import 'package:onlinebia/apps/view/order/widget/order_status.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class OrderInfoTile extends StatelessWidget {
  int? index;
  OrderStatusMain? orderStatusName;

  OrderInfoTile({Key? key,  this.orderStatusName, this.index=0}) : super(key: key);
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [

                  index==0?Container():
                  WidgetHelper.getDivider(width: MediaQuery.of(context).size.width),
                SizedBox(height: 10,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   Container(
                          height: 80,
                          width: 80,
                          child: Image(image: AssetsHelper.getImage('thumnail.png'))
                      ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("T-Shirt",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "AppSemiBold",
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 10,),
                          Row(
                              children: [
                                Text( "#62",
                                  style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AppBold",
                                ),),
                                SizedBox(width: 15,),
                                Text( "Size : L",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "AppSemiBold"
                                ),),
                              ],
                            ),
                          SizedBox(height: 10,),
                          Text("Quantity : 2",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AppSemiBold",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(orderStatusName == OrderStatusMain.ALL)
                      OrderStatus(orderStatus: Random().nextInt(3),)
                  ],
                ),


              ],
            ),
          ));
  }
}

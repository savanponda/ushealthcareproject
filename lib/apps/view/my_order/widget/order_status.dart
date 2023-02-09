import 'package:flutter/material.dart';
import 'package:onlinebia/apps/enum/order_status_type.dart';
import 'package:onlinebia/style/AppColor.dart';

class OrderStatus extends StatelessWidget {
    int? orderStatus;
  OrderStatus({Key? key,  this.orderStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
      color: getStatusTextColor(orderStatus!,0.1),
      child: Text(getStatusTitle(orderStatus!),
        style: TextStyle(
            color: getStatusTextColor(orderStatus!,1),
            fontSize: 12,
            fontFamily: "AppSemiBold"
        ),),
    );
  }

   String getStatusTitle(int status){
    if(status==OrderStatusType.DELIVERED.index){
      return "Delivered"; }
    else if(status==OrderStatusType.CANCELLED.index){
      return "Cancelled"; }
     else{
     return "On Process"; }
  }

  Color getStatusTextColor(int status, double opacity){
    if(status==OrderStatusType.DELIVERED.index){
      return AppColor.deliveredTextColor.withOpacity(opacity); }
    else if(status==OrderStatusType.CANCELLED.index){
      return AppColor.cancelledTextColor.withOpacity(opacity); }
    else{
      return AppColor.onProcessTextColor.withOpacity(opacity);}
  }
}

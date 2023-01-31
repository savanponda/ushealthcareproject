import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/order_summary/tile/order_info_tile.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class OrderSummaryInfo extends StatelessWidget {
  const OrderSummaryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      color: Colors.white,
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
                Text("Order No",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "AppSemiBold",
                    )
                ),
                Text("#1254897561",
                    style: TextStyle(
                      color: AppColor.FieldTextColor,
                      fontSize: 14,
                      fontFamily: "AppRegular",
                    )
                ),
              ],
            ),
          ),
          for(int index=0;index<3;index++)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                    child:  ProductDetailsTile(),
                ),
              WidgetHelper.getDivider(width:MediaQuery.of(context).size.width*0.76),
              ],
            ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Sub Total",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "AppSemiBold",
                  )
              ),
              SizedBox(width: 30,),
              Text("\$195",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "AppBold",
                    color: Colors.black,
                  )
              ),
            ],
          ),
          SizedBox(height: 40,)
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

import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/order_summary/tile/payment_tile.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class OrderSummaryModal extends StatelessWidget {
  const OrderSummaryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        children: [
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "orderSummary"),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              ),
              GestureDetector(
                onTap: (){
                  NavigatorHelper.remove();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColor.FieldBorderColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColor.FieldBorderColor, width: 2),
                  ),
                    child: Image(
                      image: AssetsHelper.getIcon("ic_close.png"),
                    )
                ),
              )
            ],
          ),
          SizedBox(height: 39,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "subTotal"),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontFamily: "AppRegular",
                ),
              ),
              Text("\$195",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "AppSemiBold",
                    fontWeight: FontWeight.w500,
                  )
              ),
            ],
          ),
          SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "shipping"),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontFamily: "AppRegular",
                ),
              ),
              Text(buildTranslate(context, "free"),
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColor.appGreen,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ],
          ),
          SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "packagingFee"),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontFamily: "AppRegular",
                ),
              ),
              Text("\$2",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "AppSemiBold",
                    fontWeight: FontWeight.w500,
                  )
              ),
            ],
          ),
          SizedBox(height: 17,),
          WidgetHelper.getDivider(width:MediaQuery.of(context).size.width),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "grandTotal"),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontFamily: "AppRegular",
                ),
              ),
              Text("\$197",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "AppSemiBold",
                    fontWeight: FontWeight.w500,
                  )
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            child: PaymentTile(),
          ),
        ],
      ),
    );
  }
}

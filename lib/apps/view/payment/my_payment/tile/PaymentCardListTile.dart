import 'package:flutter/material.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';


class PaymentCardListTile extends StatelessWidget {
  int? index;

  PaymentCardListTile({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? SelectPaymentCard ;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
        child: Column(
          children: [
            index==0?Container():Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: AppColor.appDivider,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: AssetsHelper.getImage('thumnail.png'),
                          fit: BoxFit.fill
                      )
                  ),
                ),

                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text("HDFC",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "AppSemiBold",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Radio(
                            value: 1,
                            activeColor:AppColor.appColor,
                            groupValue: SelectPaymentCard,
                            // activeColor: AppColor.appColor,
                            onChanged: (value) {
                              SelectPaymentCard = value as int?;
                            },
                          ),
                        ],
                      ),

                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "**** **** **** ", style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AppSemiBold",
                              color: AppColor.appSubTitleText,
                            ),),
                            TextSpan(
                              text: "10234", style: TextStyle(
                                color: AppColor.appSubTitleText,
                                fontSize: 14,
                                fontFamily: "AppSemiBold"
                            ),),
                          ],
                        ),
                      ),
                      Text("John Diesel",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "AppSemiBold",
                          color: AppColor.appSubTitleText,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                     WidgetHelper.getFieldSeparator(),
                    ],),
                ),
              ],),



          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

import '../../../../../helper/AssetsHelper.dart';
import '../../../../../style/AppColor.dart';

class PaymentCardListTile extends StatelessWidget {

  PaymentCardListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? SelectPaymentCard ;

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: AssetsHelper.getImage('thumnail.png') ,
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
                                fontSize: 18,
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
                              fontSize: 18,
                              fontFamily: "AppSemiBold",
                              color: AppColor.appSubTitleText,
                            ),),
                            TextSpan(
                              text: "10234", style: TextStyle(
                                color: AppColor.appSubTitleText,
                                fontSize: 18,
                                fontFamily: "AppSemiBold"
                            ),),
                          ],
                        ),
                      ),
                      Text("John Diesel",
                        style: TextStyle(
                          fontSize: 18,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: AppColor.appDivider,
            ),

          ],
        ),
      ),
    );
  }
}

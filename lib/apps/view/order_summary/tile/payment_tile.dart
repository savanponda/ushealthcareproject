import 'package:flutter/material.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class PaymentTile extends StatelessWidget {
   PaymentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.appBgGray.withOpacity(0.20),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:  EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 45,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 13,right: 13,bottom: 7,top: 7),
                          child: Image(
                            color: AppColor.appBarText,
                            image: AssetsHelper.getIcon("ic_wallet.png"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("UShealthcare wallet",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: "AppSemiBold",
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                Text("\$97",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 45,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 8,right: 8,bottom: 10,top: 10),
                          child: Image(
                            color: AppColor.appBarText,
                            image: AssetsHelper.getIcon("ic_card.png"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("...2356",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: "AppSemiBold",
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                Text("\$100",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

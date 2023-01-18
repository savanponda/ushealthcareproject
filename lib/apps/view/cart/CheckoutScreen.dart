import 'package:flutter/material.dart';
import 'package:onlinebia/apps/tiles/CategoryItemTile.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../helper/AssetsHelper.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../tiles/OrderInfoTile.dart';
import '../../tiles/ProductBottomNavigation.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "checkout"),
          showFilterIcon: true,
          showNotificationIcon: false,
          centerTitle: true,
          shownotificationIcon: true,
          showIcon: true,
          showBackIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      bottomNavigationBar: ProductBottomNavigation(
          callback: (){
            NavigatorHelper.add(CheckoutScreen());
          },
        TotalTitle: true,
        BottomButtonTitle1: 'Add To Cart',
        BottomButtonTitle2: 'Checkout',
      ),
      body:  Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHelper.getFieldSeparator(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery Location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                      WidgetHelper.getFieldSeparator(),
                      Row(
                        children: [
                          Expanded(
                            child: Text("John Diesel Home",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "AppBold",
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Image(image: AssetsHelper.getIcon("ic_edit.png"), height: 20, width: 20,),

                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(
                            child: Text("23rd Street, Zara Circle, Western Railway, UK.",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "AppRegular",
                                color: AppColor.appSubTitleText,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      WidgetHelper.getFieldSeparator(
                        height: 20
                      ),
                      Text("Order Info",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                      Wrap(
                        spacing: MediaQuery.of(context).size.width*0.09,
                        alignment: WrapAlignment.start,
                        children: [
                          for(int index=0;index<2;index++)
                            OrderInfoTile()
                        ],
                      ),
                      WidgetHelper.getFieldSeparator(),

                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  color: AppColor.appBgGray,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub Total",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "AppSemiBold",
                                )
                            ),
                            Text("#127",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "AppSemiBold",
                                )
                            ),
                          ],
                        ),
                        WidgetHelper.getFieldSeparator(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub Total",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "AppSemiBold",
                                )
                            ),
                            Text("Free",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "AppSemiBold",
                                )
                            ),
                          ],
                        ),
                        WidgetHelper.getFieldSeparator(),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: AppColor.appDivider,
                        ),
                        WidgetHelper.getFieldSeparator(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "AppSemiBold",
                                )
                            ),
                            Text("#127",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "AppSemiBold",
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                WidgetHelper.getFieldSeparator(),

              ],
            ),
          ),
        ),
      )
    );
  }
}

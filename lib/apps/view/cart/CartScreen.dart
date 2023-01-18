import 'package:flutter/material.dart';
import 'package:onlinebia/apps/tiles/CategoryItemTile.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../helper/AssetsHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../tiles/ProductBottomNavigation.dart';
import 'CheckoutScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "cart"),
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
            BottomButtonTitle2: 'Place Order',
      ),
      body:  Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Wrap(
                    spacing: MediaQuery.of(context).size.width*0.09,
                    alignment: WrapAlignment.start,
                    children: [
                      for(int index=0;index<2;index++)
                        CategoryItemTile(MoveToCart: true,)
                    ],
                  ),
                ),
                WidgetHelper.getFieldSeparator(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  color: AppColor.appBgGray.withOpacity(0.2),
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
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30,bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetsHelper.getIcon("ic_save.png"),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10,),
                      Text("Save For Later",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Wrap(
                    spacing: MediaQuery.of(context).size.width*0.09,
                    alignment: WrapAlignment.start,
                    children: [
                      for(int index=0;index<2;index++)
                        CategoryItemTile(MoveToCart: false,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

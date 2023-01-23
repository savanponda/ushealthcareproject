import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/common/product_tile.dart';
import 'package:onlinebia/apps/view/cart/cart_page.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../helper/AssetsHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<ProductDetailScreen> {
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
            NavigatorHelper.add(CartPage());
          },
            TotalTitle: false,
            BottomButtonTitle1: 'Add To Cart',
            BottomButtonTitle2: 'Buy Now',
      ),
      body:  Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  WidgetHelper.getFieldSeparator(),
                  getProductName(),
                  WidgetHelper.getFieldSeparator(),
                  getProductSize(),
                  WidgetHelper.getFieldSeparator(),
                  getColorName(),
                  WidgetHelper.getFieldSeparator(),
                  Center(
                    child: Wrap(
                      spacing: 30,
                      children: [
                        for(int index=0;index<5;index++)
                          ProductTile(buttonLiked: true,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget getProductName(){
    return  Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Women's Blezer",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
                height: 30, width: 30,
                decoration: BoxDecoration(
                    color: AppColor.FieldColor,
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image(
                    image: AssetsHelper.getIcon("ic_share.png"),),
                )
            ),
            SizedBox(width: 10,),
            Container(
                height: 30, width: 30,
                decoration: BoxDecoration(
                    color: AppColor.FieldColor,
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image(
                    image: AssetsHelper.getIcon("ic_heart_filled.png"),),
                )
            ),
            WidgetHelper.getFieldSeparator(),

          ],
        ),
        Row(
          children: [
            Text("#45",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "AppBold",
                color: Colors.black,
              ),),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 4),
              child: Image(
                height: 20, width: 20,
                image: AssetsHelper.getIcon("ic_star.png"),),
            ),
            Text("4.0 (7)",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "AppRegular",
                color: AppColor.appSubTitleText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Image(
                height: 20, width: 20,
                image: AssetsHelper.getIcon("ic_buy.png"),),
            ),
            Text("85 Sold",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "AppRegular",
                color: AppColor.appSubTitleText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        WidgetHelper.getFieldSeparator(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    );
  }
  Widget getProductSize(){
    return  Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Size",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text("Size",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "AppSemiBold",
                color: AppColor.appColor,
              ),
            ),
            SizedBox(width: 10,),
            WidgetHelper.getFieldSeparator(),

          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5),),
                border: Border.all(color:AppColor.appDivider, width: 2),
              ),
              child: Text("XXL",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppSemiBold",
                  color: Colors.black,
                ),),
            ),
          ],
        ),
        WidgetHelper.getFieldSeparator(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    );
  }
  Widget getColorName(){
    return  Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Color",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10,),
            WidgetHelper.getFieldSeparator(),

          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:AppColor.appDivider, width: 2),
              ),
            ),
          ],
        ),
        WidgetHelper.getFieldSeparator(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    );
  }

}

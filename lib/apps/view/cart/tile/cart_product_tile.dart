import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinebia/apps/view/cart/counter_bloc/counter_bloc.dart';
import 'package:onlinebia/apps/view/cart/counter_bloc/counter_state.dart';
import 'package:onlinebia/apps/view/cart/tile/product_counter.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../counter_bloc/counter_event.dart';

class CartProductTile extends StatelessWidget {
  final bool MoveToCart ;

  CartProductTile({Key? key, this.MoveToCart=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15),),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: Offset(0,0), // changes position of shadow
          ),],
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          WidgetHelper.getFieldSeparator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10),),),
                    height: 80,
                    width: 80,
                    child: Image(image: AssetsHelper.getImage('thumnail.png'))
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("T-Shirt",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "AppSemiBold",
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10,),
                      Text("#62",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "AppBold",
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2,),
                      // ProductCounter(),

                      Row(
                        children: [
                          Expanded(
                            child: Row(
                                children: [
                                  Text("Size : L",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "AppSemiBold",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                            ),
                          ),
                          ProductCounter(),
                        ],
                      ),
                      SizedBox(height: 3,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          WidgetHelper.getFieldSeparator(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: MoveToCart?AssetsHelper.getIcon("ic_move_to_cart.png"):
                        AssetsHelper.getIcon("ic_save.png"),
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(width: 10,),
                      MoveToCart?Text(buildTranslate(context, "moveToCart"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppSemiBold",
                          )
                      ):Text(buildTranslate(context, "saveForLater"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  height: 50,
                  color: AppColor.appDivider,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetsHelper.getIcon("ic_trash.png"),
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(width: 10,),
                      Text(buildTranslate(context, "remove"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

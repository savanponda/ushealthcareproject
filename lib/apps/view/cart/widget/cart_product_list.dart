import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_tile.dart';

import '../../../../../helper/AssetsHelper.dart';
import '../tile/cart_product_tile.dart';

class CartProductList extends StatelessWidget {
  bool moveToCart;
  bool saveForLater;
  CartProductList({Key? key,required this.moveToCart, required this.saveForLater}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Visibility(
          visible: saveForLater,
          child: Padding(
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
        ),
        Container(
          child:  Center(
            child: Wrap(
              spacing: MediaQuery.of(context).size.width*0.09,
              alignment: WrapAlignment.start,
              children: [
                for(int index=0;index<2;index++)
                  CartProductTile(
                    MoveToCart: moveToCart,
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
